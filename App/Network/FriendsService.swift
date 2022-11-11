//
//  FriendsService.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

final class FriendsService {
    
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    //MARK: - Load Friends
    func loadFriends() {
        guard let token = Singleton.instance.token else { return }
        
        let params = [
            "v" : "5.131",
            "order": "hints",
            "fields": "photo_100, first_name, last_name"
        ]
        
        let url: URL = .configureURL(token: token,
                                     typeMethod: "/method/friends.get",
                                     params: params)
        print("DBG LoadFriends", url)
        
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(FriendResponse.self, from: data).response.items
                DispatchQueue.main.async {
                    self.saveFriends(result)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

//MARK: - Private Extension
private extension FriendsService {
    func saveFriends(_ friends: [Friends]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            try realm.write {
                realm.add(friends, update: .modified)
            }
        } catch {
            print("DBG", error)
        }
    }
}
