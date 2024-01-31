//
//  RepoDetailsPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class RepoDetailsPresenter {
    let view: RepoDetailsViewDelegate
    let networkClient: APIProtocol
    var presentedRepo: Repo
    var repoDetails: RepoDetails?
    var repoTags: [RepoTag]?
    var user: User?

    init(view: RepoDetailsViewDelegate, networkClient: APIProtocol = NetworkManager(), presentedRepo: Repo, user: User?) {
        self.view = view
        self.networkClient = networkClient
        self.presentedRepo = presentedRepo
        self.user = user
    }
    
    func fetchRepoDetails() {
        networkClient.getRepoDetails(for: presentedRepo) { repoDetails, error in
            if let error = error {
                self.view.showError(error: error)
                return
            }
            self.repoDetails = repoDetails
            self.fetchRepoTags()
        }
    }
    
    func fetchRepoTags() {
        networkClient.getRepoTags(for: presentedRepo) { repoTags, error in
            if let error = error {
                self.view.showError(error: error)
                return
            }

            self.repoTags = repoTags
            self.view.updateUI(repoTags: self.repoTags)
        }
    }
    
    func getRepoTags() -> [RepoTag] {
        return repoTags ?? []
    }
}
