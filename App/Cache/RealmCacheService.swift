//
//  RealmCacheService.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

final class RealmCacheService {
    
    func create<T: Object>(_ object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    func create<T: Object>(_ object: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    func read<T: Object>(_ object: T.Type) throws -> [T] {
        let realm = try Realm()
        return Array(realm.objects(object))
    }

    func read<T: Object>(_ object: T.Type) throws -> Results<T> {
        let realm = try Realm()
        return realm.objects(object)
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            let realm = try Realm()
            try realm.write{
                realm.delete(object)
            }
        } catch {
            print(error)
        }
    }
}
