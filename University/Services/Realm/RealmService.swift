//
//  RealmService.swift
//  University
//
//  Created by Hardik on 17/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import RealmSwift

class RealmService<T>: RealmServiceProtocol where T: RealmEntity, T: Object, T.EntityType: Entity {
    
    typealias RealmEntityType = T
    
    private let realm = try! Realm()
    
    func save(item: T.EntityType) throws {
        try realm.write {
            realm.add(item.realmObject as! T)
        }
    }
    
    func save(items: [T.EntityType]) throws {
        try realm.write {
            items.forEach {
                realm.add($0.realmObject as! T, update: .all)
            }
        }
    }
    
    func update(block: @escaping () -> ()) throws {
        try realm.write() {
            block()
        }
    }
    
    func delete(item: T.EntityType) throws {
        try realm.write() {
            realm.delete(item.realmObject as! T)
        }
    }
    
    func deleteAll() throws {
        try realm.write() {
            realm.delete(realm.objects(T.self))
        }
    }
    
    func fetchAll() -> [T.EntityType] {
        return realm.objects(T.self).compactMap {
            $0.entityObject
        }
    }
}
