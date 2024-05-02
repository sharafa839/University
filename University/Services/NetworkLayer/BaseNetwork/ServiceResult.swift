//
//  ServiceResult.swift
//  University Assessment
//
//  Created by Sharaf on 4/22/20.
//  Copyright © 2020 apple. All rights reserved.
//

enum RequestResult<T> {
    
    case success(T)
    case failure(ApiError)
}
