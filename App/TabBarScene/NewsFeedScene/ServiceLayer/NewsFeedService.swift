//
//  NewsFeedService.swift
//  App
//
//  Created by Alexander Chervoncev on 19.08.22.
//

import Foundation
import RealmSwift

final class NewsFeedService {
    
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    func loadFeedNews()  {
        guard let token = Singleton.instance.token else { return }
        
        let params = [
            "v": "5.131", 
            "filters": "post, photo",
            "count": "50"
        ]
        
        let url: URL = .configureURL(token: token,
                                     typeMethod: "/method/newsfeed.get",
                                     params: params)
        print("DBG LoadNews", url)
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(NewsFeedResponse.self, from: data).response.items
                DispatchQueue.main.async {
                    self.saveNewsFeed(result)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

private extension NewsFeedService {
    func saveNewsFeed(_ newsFeed: [NewsFeed]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            try realm.write {
                realm.add(newsFeed, update: .modified)
            }
        } catch {
            print("DBG", error)
        }
    }
}
