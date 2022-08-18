//
//  GroupService.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation
import RealmSwift

class GroupService {
    typealias GroupResult = Result<[Group], Constants.Service.ServiceError>
    
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
    
    //MARK: - Search Groups
    func searchGroups(text: String, completion: @escaping (GroupResult) -> ()) {
        guard let token = Singleton.instance.token else { return }
        
        let params = ["q": text,
                      "extended": "1",
                      "v": "5.131"
        ]
        
        let url: URL = .configureURL(token: token,
                                     typeMethod: "/method/groups.search",
                                     params: params)
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.requestError(error)))
            }
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(GroupResponse.self, from: data)
                completion(.success(result.response.items))
            } catch {
                completion(.failure(.parseError))
            }
        }.resume()
    }
    
    //MARK: - Add Group
    func addGroup(id: Int,
                  completion: @escaping(Result<JoinOrLeaveGroup,
                                        Constants.Service.ServiceError>) -> Void) {
        guard let token = Singleton.instance.token else { return }
        
        let params = ["group_id": "\(id)",
                      "v": "5.131"
        ]
        
        let url: URL = .configureURL(token: token,
                                     typeMethod: "/method/groups.join",
                                     params: params)
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.requestError(error)))
            }
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(JoinOrLeaveGroup.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
            }
        }.resume()
    }
    
    //MARK: - Load Groups
    func loadGroup() {
        guard let token = Singleton.instance.token else { return }
        
        let params = [
            "extended" : "1",
            "v" : "5.131"
        ]
    
        let url: URL = .configureURL(token: token,
                                     typeMethod: "/method/groups.get",
                                     params: params)
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(GroupResponse.self, from: data).response.items
                DispatchQueue.main.async {
                    self.saveGroups(result)
                }
            } catch {
                print("DBG Group parseError", Constants.Service.ServiceError.parseError)
            }
        }.resume()
    }
}

//MARK: - Private Extensions
private extension GroupService {
    func saveGroups(_ groups: [Group]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL ?? "")
            try realm.write {
                realm.add(groups, update: .modified)
            }
        } catch {
            print("DBG", error)
        }
    }
}
