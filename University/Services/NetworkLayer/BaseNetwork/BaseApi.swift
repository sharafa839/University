//
//  BaseApi.swift
//  University Assessment
//
//  Created by Sharaf on 30/10/2021.
//

import Foundation
import Alamofire

class BaseApi <T:TargetType> {
    
    func fetchData <M:Codable> (target:T, completion: @escaping (RequestResult<M>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParameters(task: target.task)
        AF.request(
            target.baseURL+target.path,
            method: method,
            parameters: parameters.0,
            encoding: parameters.encoding,
            headers: headers
        ).responseJSON { res in
            guard let statusCode = res.response?.statusCode else {
                completion(.failure(.init(status: 0, message: "network error")))
                return
            }
            print(res.response?.url)
            if statusCode == 200 {
                guard  let jsonResponse = try? res.result.get() else {
                    completion(.failure(.init(status: 0, message: "")))
                    return
                }
                guard  let theJsonData = try? JSONSerialization.data(
                    withJSONObject: jsonResponse,
                    options: .prettyPrinted
                ) else {
                    completion(.failure(.init(status: 0, message: "can't map model")))
                    return
                }
                guard  let responseObject = try? JSONDecoder().decode(
                    M.self,
                    from: theJsonData
                ) else {
                    completion(.failure(.init(status: 0, message: "something went wrong")))
                    return
                }
                completion(.success(responseObject))
                
            }
        }
    }
    
    private func buildParameters (task: Task)-> ([String:Any], encoding: ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters, encoding)
        }
    }
}
