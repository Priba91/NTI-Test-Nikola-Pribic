//
//  RepoHeaderPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import Foundation

class RepoHeaderPresenter {
    let repo: Repo?
    let user: User?
    
    init(repo: Repo?, user: User?) {
        self.repo = repo
        self.user = user
    }
    
    func getRepoUserName() -> String {
        return user?.name ?? ""
    }
    
    func getRepoUserAvatarUrl() -> String {
        return user?.avatarUrl ?? ""
    }

    func getRepoName() -> String {
        return repo?.name ?? ""
    }
    
    func getRepoForksCountString() -> String {
        return "\(repo?.forksCount ?? 0)"
    }
    
    func getRepoWatchersCountString() -> String {
        return "\(repo?.watchersCount ?? 0)"
    }
}
