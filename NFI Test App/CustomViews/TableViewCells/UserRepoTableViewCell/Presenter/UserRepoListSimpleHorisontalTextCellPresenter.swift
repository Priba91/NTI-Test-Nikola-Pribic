//
//  UserRepoListSimpleHorisontalTextCellPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

class UserRepoListSimpleHorisontalTextCellPresenter: SimpleHorisontalTextCellProtocol {
    let repo: Repo
    
    init(repo: Repo) {
        self.repo = repo
    }

    func getTitleLabelText() -> String {
        return repo.name ?? ""
    }
    
    func getDescriptionTitleText() -> String {
        return "\(repo.openIssuesCount ?? 0)"
    }    
}
