//
//  UniversityNetworking.swift
//  University Assessment
//
//  Created by Sharaf on 31/10/2021.
//

import Foundation

protocol UniversityNetworkingProtocol {
    
    func getUniversities(completion : @escaping(RequestResult<UniversityResponse>)->Void)
}


extension UniversityNetworkingProtocol  {
    
    private var repo: UniversityRepo {
        return UniversityRepo()
    }
    
    func getUniversities(completion : @escaping(RequestResult<UniversityResponse>)->Void) {
        repo.fetchData(target: .getUniversities, completion: completion)
    }
}
