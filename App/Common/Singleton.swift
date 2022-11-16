//
//  Singleton.swift
//  App
//
//  Created by Alexander Chervoncev on 29.07.22.
//

import Foundation

class Singleton {
    
    static let instance = Singleton()
    
    private init() {}
    
    var id: Int? = 0
    var token: String? = ""
}
