//
//  UserReposPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class UserReposPresenter {
    let view: UserReposViewDelegate?
    let networkClient: APIProtocol
    
    var userRepos: [Repo]?
    var user: User?
    
    init(_ view: UserReposViewDelegate?, networkClient: APIProtocol = NetworkManager()) {
        self.view = view
        self.networkClient = networkClient
    }
    
    func fetchData() {
        networkClient.getUserDetails(completition: { user, error in
            if let error = error {
                self.view?.showError(error: error)
                return
            }
            self.user = user
            self.fetchUserRepos()
        })
    }
    
    private func fetchUserRepos() {
        networkClient.getUserRepos { userRepos, error in
            if let error = error {
                self.view?.showError(error: error)
                return
            }
            self.userRepos = userRepos
            self.view?.updateUI(repos: userRepos)
        }
    }

    func getUserRepos() -> [Repo] {
        return userRepos ?? []
    }
    
    func getUser() -> User? {
        return user
    }
}
