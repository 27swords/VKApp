//
//  FriendsProfileModel.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

struct PhotoResponse: Decodable {
    let response: PhotoItems
}

struct PhotoItems: Decodable {
    let items: [Photo]
}

class Photo: Object, Decodable {
    @objc dynamic var album = 0
    @objc dynamic var date = 0
    @objc dynamic var id = 0
    @objc dynamic var likes: Likes?
    var sizes = List<Sizes>()
    
    enum CodingKeys: String, CodingKey {
        case album = "album_id"
        case date
        case id
        case likes
        case sizes
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

class Likes: Object, Decodable {
    @objc dynamic var count = 0
    @objc dynamic var userLikes = 0
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
    }
}

class Sizes: Object, Decodable {
    @objc dynamic var height = 0
    @objc dynamic var type: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var width = 0
    
}
