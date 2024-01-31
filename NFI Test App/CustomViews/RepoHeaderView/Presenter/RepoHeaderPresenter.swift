//
//  RepoHeaderPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import Foundation

class RepoHeaderPresenter {
    let repoDetails: RepoDetails?
    let user: User?
    
    init(repoDetails: RepoDetails?, user: User?) {
        self.repoDetails = repoDetails
        self.user = user
    }
    
    func getRepoUserName() -> String {
        return user?.name ?? ""
    }
    
    func getRepoUserAvatarUrl() -> String {
        return user?.avatarUrl ?? ""
    }

    func getRepoName() -> String {
        return repoDetails?.name ?? ""
    }
    
    func getRepoForksCountString() -> String {
        return "\(repoDetails?.forksCount ?? 0)"
    }
    
    func getRepoWatchersCountString() -> String {
        return "\(repoDetails?.watchersCount ?? 0)"
    }
}
