//
//  TargetType.swift
//  University Assessment
//
//  Created by Sharaf on 30/10/2021.
//

import Foundation
import Alamofire

enum httpMethod : String {
    
    case Get = "GET"
    case Post = "POST"
    case Put = "PUT"
    case Delete  = "DELETE"
}

enum Task {
    
    case requestPlain
    case requestParameters(parameters: [String:Any], encoding: ParameterEncoding)
}

protocol TargetType {
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get  }
    var task: Task { get }
    var headers: [String:String]? {get}
}
