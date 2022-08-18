//
//  Constants.swift
//  App
//
//  Created by Alexander Chervoncev on 30.07.22.
//

import Foundation

struct Constants {
    enum Service: String {
        enum ServiceError: Error {
            case parseError
            case requestError(Error)
        }

        case scheme = "https"
        case host = "api.vk.com"
    }
}

