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
            name: "Public 1",
            date: "Date",
            description: "Test description",
            imageDescription: UIImage(named: "VKLaunchScreen"),
            avatarImage: UIImage(named: "VKLaunchScreen")
        )
        
        let news1 = NewsWall(
            name: "Public 2",
            date: "Date",
            description: "Test description",
            imageDescription: UIImage(named: "VKLaunchScreen"),
            avatarImage: UIImage(named: "VKLaunchScreen")
        )
        
        let news2 = NewsWall(
            name: "Public 3",
            date: "Date",
            description: "Test description",
            imageDescription: UIImage(named: "VKLaunchScreen"),
            avatarImage: UIImage(named: "VKLaunchScreen")
        )
        
        let news3 = NewsWall(
            name: "Public 4",
            date: "Date",
            description: "Test description",
            imageDescription: UIImage(named: "VKLaunchScreen"),
            avatarImage: UIImage(named: "VKLaunchScreen")
        )
        
        self.newsWall = [news, news1, news2, news3]
    }
}
