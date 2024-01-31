//
//  RepoTag.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class RepoTag: Decodable {
    var name: String?
    var commit: Commit?
    
    private enum CodingKeys : String, CodingKey {
        case name
        case commit
    }
}
