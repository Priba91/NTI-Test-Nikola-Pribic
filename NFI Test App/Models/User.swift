//
//  User.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class User: Decodable {
    var id: Int?
    var name: String?
    var avatarUrl: String?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case avatarUrl = "avatar_url"
    }
}
