//
//  UserRepoHorisontalTextCellPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import Foundation

class UserRepoHorisontalTextCellPresenter: HorisontalTextCellProtocol {
    let repo: Repo
    
    init(repo: Repo) {
        self.repo = repo
    }
    
    func getLeftText() -> String {
        return repo.name ?? ""
    }
    
    func getRightText() -> String {
        "opened_issues".localized() + ": \(repo.openIssuesCount ?? 0)"
    }
}
