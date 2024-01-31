//
//  RepoDetails.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class RepoDetails: Decodable {
    var id: Int?
    var name: String?
    var owner: User?
    var forksCount: Int?
    var watchersCount: Int?
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case owner
        case forksCount = "forks_count"
        case watchersCount = "watchers_count"
    }
}
