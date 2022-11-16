//
//  Extensions+URL.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation

extension URL {
    static func configureURL(token: String,
                             typeMethod: String,
                             params: [String: String]) -> URL {
        var queryItems: [URLQueryItem] = []
        params.forEach { name, value in
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        
        queryItems.append(.init(name: "access_token", value: token))
        
        var components = URLComponents()
        components.scheme = Constants.Service.scheme.rawValue
        components.host = Constants.Service.host.rawValue
        components.path = typeMethod
        components.queryItems = queryItems
        
        guard let url = components.url else { fatalError("") }
        
        return url
    }
}
