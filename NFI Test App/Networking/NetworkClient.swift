//
//  NetworkClient.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

final class NetworkClient: APIProtocol {
    
    func getUserDetails(completition: @escaping (_ user: User?, _ error: APIError?) -> Void) {
        let endPoint = "/users/octocat"
        ClientHandler.shared.request(method: .get, url: NetworkConstants.getBaseUrl(with: endPoint)) { responseData, error in
            if let responseData = responseData {
                do {
                    let user = try JSONDecoder().decode(User.self, from: responseData)
                    completition(user, nil)
                } catch {
                    completition(nil, APIError(.Generic))
                }
            } else {
                completition(nil, error)
            }
        }
    }
    
    func getUserRepos(completition: @escaping (_ userRepos: [Repo]?, _ error: APIError?) -> Void) {
        let endPoint = "/users/octocat/repos"
        ClientHandler.shared.request(method: .get, url: NetworkConstants.getBaseUrl(with: endPoint)) { responseData, error in
            if let responseData = responseData {
                do {
                    let userRepos = try JSONDecoder().decode([Repo].self, from: responseData)
                    completition(userRepos, nil)
                } catch {
                    completition(nil, APIError(.Generic))
                }
            } else {
                completition(nil, error)
            }
        }
    }
    
    func getRepoTags(for repo: Repo, completition: @escaping (_ repoTags: [RepoTag]?, _ error: APIError?) -> Void) {
        let endPoint = "/repos/octocat/\(repo.getName())/tags"
        ClientHandler.shared.request(method: .get, url: NetworkConstants.getBaseUrl(with: endPoint)) { responseData, error in
            if let responseData = responseData {
                do {
                    let repoDetails = try JSONDecoder().decode([RepoTag].self, from: responseData)
                    completition(repoDetails, nil)
                } catch {
                    completition(nil, APIError(.Generic))
                }
            } else {
                completition(nil, error)
            }
        }
    }
}
