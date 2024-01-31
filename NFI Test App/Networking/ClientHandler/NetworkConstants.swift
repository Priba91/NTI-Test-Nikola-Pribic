//
//  NetworkConstants.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

struct NetworkConstants {
    static let baseUrl = "https://api.github.com"
    
    static func getBaseUrl(with path: String) -> String {
        return baseUrl + path
    }
}
