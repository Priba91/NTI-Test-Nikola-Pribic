//
//  APIProtocol.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

protocol APIProtocol {
    func getUserDetails(completition: @escaping (_ user: User?, _ error: APIError?) -> Void)
    func getUserRepos(completition: @escaping (_ userRepos: [Repo]?, _ error: APIError?) -> Void)
    func getRepoTags(for repo: Repo, completition: @escaping (_ repoTags: [RepoTag]?, _ error: APIError?) -> Void)
}
