//
//  FriendsModel.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

struct FriendResponse: Decodable {
    let response: FriendItems
}

struct FriendItems: Decodable {
    let items: [Friends]
}

final class Friends: Object, Decodable {
    
    @objc dynamic var id = 0
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var photo100 = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}
