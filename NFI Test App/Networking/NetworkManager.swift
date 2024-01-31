//
//  NetworkManager.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import Foundation

//Added another Networking layer to fulfil test requirements to have single place with dependency injection to switch all api calls between live and mock calls. But we can also init any ViewController Presenter with mock network client for test purposes.

class NetworkManager: APIProtocol {
    let client = NetworkClient() //NetworkMockClient()

    func getUserDetails(completition: @escaping (User?, APIError?) -> Void) {
        client.getUserDetails(completition: completition)
    }
    
    func getUserRepos(completition: @escaping ([Repo]?, APIError?) -> Void) {
        client.getUserRepos(completition: completition)
    }
    
    func getRepoDetails(for repo: Repo, completition: @escaping (RepoDetails?, APIError?) -> Void) {
        client.getRepoDetails(for: repo, completition: completition)
    }
    
    func getRepoTags(for repo: Repo, completition: @escaping ([RepoTag]?, APIError?) -> Void) {
        client.getRepoTags(for: repo, completition: completition)
    }
}
