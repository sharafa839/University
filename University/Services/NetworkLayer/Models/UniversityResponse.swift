//
//  UniversityResponse.swift
//  University Assessment
//
//  Created by Sharaf on 5/1/24.
//

import Foundation

struct UniversityResponseElement: Codable {
    
    let domains: [String]?
    let stateProvince: String?
    let name: String?
    let webPages: [String]?
    let country: String?
    let alphaTwoCode: String?

    enum CodingKeys: String, CodingKey {
        case domains
        case stateProvince = "state-province"
        case name
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
}

typealias UniversityResponse = [UniversityResponseElement]
