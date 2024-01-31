//
//  Repo.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class Repo: Decodable {
    var id: Int?
    var name: String?
    var openIssuesCount: Int?
    var owner: User?
        
    func getName() -> String {
        return name ?? ""
    }
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case openIssuesCount = "open_issues_count"
        case owner
    }
}
