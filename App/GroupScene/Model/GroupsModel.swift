//
//  GroupsModel.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

struct GroupResponse: Decodable {
    let response: GroupItems
}

struct GroupItems: Decodable {
    let items: [Group]
}

class Group: Object, Decodable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photo50: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo50 = "photo_50"
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}
