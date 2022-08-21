//
//  NewsFeeddModel.swift
//  App
//
//  Created by Alexander Chervoncev on 18.08.22.
//

import Foundation
import RealmSwift

struct NewsFeedResponse: Decodable {
    let response: NewsFeedItems
}

struct NewsFeedItems: Decodable {
    let items: [NewsFeed]
}

class NewsFeed: Object, Decodable {
    @objc dynamic var sourceId = 0
    @objc dynamic var postId = 0
    @objc dynamic var text: String? = ""
    @objc dynamic var date = 0
    var comments = List<CountableItem>()
    var likes = List<CountableItem>()
    var reposts = List<CountableItem>()
    var views = List<CountableItem>()
    
    enum CodingKeys: String, CodingKey {
        case sourceId = "source_ids"
        case postId = "post_id"
        case text
        case date
        case comments
        case likes
        case reposts
        case views
    }
//    
//    override class func primaryKey() -> String? {
//        return "id"
//    }
}

class CountableItem: Object, Decodable {
    @objc dynamic var count = 0
}
