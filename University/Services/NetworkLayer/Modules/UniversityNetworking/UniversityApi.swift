//
//  UniversityApi.swift
//  University Assessment
//
//  Created by Sharaf on 31/10/2021.
//

import Foundation
import Alamofire

enum UniversityApi {
    
    case getUniversities
}

extension UniversityApi: TargetType{
    
    var baseURL: String {
        switch self {
            
        default:
            return "http://universities.hipolabs.com"
        }
    }
    
    var path: String {
        switch self {
        case .getUniversities:
            return "/search"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUniversities:
            return .get
            
        }
    }
    
    var task: Task {
        switch self {
        case .getUniversities:
            return .requestParameters(parameters: ["country":"United Arab Emirates"], encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}
