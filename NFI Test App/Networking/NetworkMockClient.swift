//
//  NetworkMockClient.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

final class NetworkMockClient: APIProtocol {
    func getUserDetails(completition: @escaping (_ user: User?, _ error: APIError?) -> Void) {
        guard let path = Bundle.main.path(forResource: "UserMockData", ofType: "json")
        else {
            completition(nil, APIError(.Generic))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let user = try JSONDecoder().decode(User.self, from: data)
            completition(user, nil)
        } catch {
            completition(nil, APIError(.Generic))
        }
    }
    
    func getUserRepos(completition: @escaping (_ userRepos: [Repo]?, _ error: APIError?) -> Void) {
        guard let path = Bundle.main.path(forResource: "UserReposMockData", ofType: "json")
        else {
            completition(nil, APIError(.Generic))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let userRepos = try JSONDecoder().decode([Repo].self, from: data)
            completition(userRepos, nil)
        } catch {
            completition(nil, APIError(.Generic))
        }
    }
    
    func getRepoDetails(for repo: Repo, completition: @escaping (_ repoDetails: RepoDetails?, _ error: APIError?) -> Void) {
        guard let path = Bundle.main.path(forResource: "RepoDetailsMockData", ofType: "json")
        else {
            completition(nil, APIError(.Generic))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let repoDetails = try JSONDecoder().decode(RepoDetails.self, from: data)
            completition(repoDetails, nil)
        } catch {
            completition(nil, APIError(.Generic))
        }
    }
    
    func getRepoTags(for repo: Repo, completition: @escaping (_ repoTags: [RepoTag]?, _ error: APIError?) -> Void) {
        guard let path = Bundle.main.path(forResource: "RepoTagsMockData", ofType: "json")
        else {
            completition(nil, APIError(.Generic))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let repoTags = try JSONDecoder().decode([RepoTag].self, from: data)
            completition(repoTags, nil)
        } catch {
            completition(nil, APIError(.Generic))
        }
    }
}
