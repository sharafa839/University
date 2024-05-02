//
//  APIException.swift
//  Nashmi
//
//  Created by Mahmoud Basyouny on 4/22/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct ApiError: LocalizedError {
    var status: Int
    var message: String
    
    var errorDescription: String? { message }
}

extension ApiError {
    
    static let somethingWrong = ApiError(status: 0, message: "somethingWentWrongTryAgainLater")
}
