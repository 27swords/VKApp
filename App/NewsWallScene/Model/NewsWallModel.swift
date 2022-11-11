//
//  NewsWallModel.swift
//  App
//
//  Created by Alexander Chervoncev on 11.11.22.
//

import UIKit

struct NewsWall {
    var name: String
    var date: String
    var description: String?
    var imageDescription: UIImage?
    var avatarImage: UIImage?
}

final class NewsWallModel {
    var newsWall = [NewsWall]()
    
    init() { newsWallSetup() }
    
    func newsWallSetup() {
        let news = NewsWall(
            name: "Name Public",
            date: "Два часа назад",
            description: "fglkfdjgslkdjglsdkjgksdjglksdjglkhjl",
            imageDescription: UIImage(named: "VKLaunchScreen"),
            avatarImage: UIImage(named: "VKLaunchScreen")
        )
        
        self.newsWall = [news]
    }
}
