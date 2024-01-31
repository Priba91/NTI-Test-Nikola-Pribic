//
//  ClientHandler.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation
import Alamofire

class ClientHandler {
     static let shared = ClientHandler()
    
    func request(method: HTTPMethod, url: String, completion: @escaping ((_ response: Data?, _ error: APIError?) -> ())) {
        
        guard isNetworkReachable() else {
            completion(nil, APIError(.NoConnection))
            return
        }
        
        Session.default.request(url, method: method, parameters: nil, headers: nil).response { response in
            if let data = response.data {
                completion(data, nil)
                return
            }
            
            if let error = response.error?.asAFError {
                completion(nil, APIError(afError: error))
                return
            }
            
            completion(nil, APIError(.Generic))
        }
        
        func isNetworkReachable() -> Bool {
            let reachabilityManager = Alamofire.NetworkReachabilityManager(host: NetworkConstants.baseUrl)
            guard let manager = reachabilityManager else {
                return false
            }
            return manager.isReachable
        }
    }
}
