//
//  UniversityEntity.swift
//  University Assessment
//
//  Created by Sharaf on 5/1/24.
//

import Foundation
import RealmSwift

struct University: Entity {
    
    typealias RealmEntityType = UniversityRealm
    
    let name: String
    let webPage: String
    let state: String
    let country: String
    let countryCode: String
    var realmObject: UniversityRealm {
        return UniversityRealm(entity: self)
    }
}

extension University {
    
    init(model: UniversityResponseElement) {
        self.init(
            name: model.name ?? "",
            webPage: model.webPages?.first ?? "",
            state: model.stateProvince ?? "",
            country: model.country ?? "",
            countryCode: model.alphaTwoCode ?? ""
        )
        
    }
    
    init(entity: RealmEntityType) {
        self.country = entity.country
        self.countryCode = entity.countryCode
        self.name = entity.name
        self.webPage = entity.webPage
        self.state = entity.state
    }
}

class UniversityRealm: Object, RealmEntity {
   
    typealias EntityType = University
    
    @Persisted var name: String = ""
    @Persisted var webPage: String = ""
    @Persisted var state: String = ""
    @Persisted var country: String = ""
    @Persisted var countryCode: String = ""
    var entityObject: University {
        return University(entity: self)
    }
    
    convenience required init(entity: EntityType) {
        self.init()
        self.name = entity.name
        self.webPage = entity.webPage
        self.country = entity.country
        self.countryCode = entity.countryCode
        self.state = entity.state
    }
    override class func primaryKey() -> String? {
        return "name"
    }
}

