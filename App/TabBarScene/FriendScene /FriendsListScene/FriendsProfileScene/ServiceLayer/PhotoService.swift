//
//  PhotoService.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

final class PhotoService {

    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    //MARK: - LoadImage
    func loadPhoto(for id: String, competion: @escaping([Photo]) -> Void) async {
        
        let params = ["owner_id": id,
                      "extended": "1",
                      "v": "5.131",
                      "album_id": "profile",
                      "rev": "1"
        ]
        
        guard let token = Singleton.instance.token else { return }
        
        let url: URL = .configureURL(token: token,
                                     typeMethod: "/method/photos.get",
                                     params: params)
        print("DBG", url)
        
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(PhotoResponse.self, from: data).response.items
            competion(result)
        } catch {
            print(error)
        }
    }
}

//MARK: - Private Extension
private extension PhotoService {
    func savePhoto(photos: [Photo]) {
        if let realm = try? Realm() {
            print(realm.configuration.fileURL ?? "")
            do {
                try realm.write({
                    realm.add(photos, update: .modified)
                })
            } catch {
                print("error")
            }
        }
    }
}
