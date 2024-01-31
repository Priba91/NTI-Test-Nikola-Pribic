//
//  RepoTagVerticalTextCellPresenter.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 31.1.24..
//

import Foundation

class RepoTagVerticalTextCellPresenter: VerticalTextCellProtocol {
    var repoTag: RepoTag?
    
    init(repoTag: RepoTag?) {
        self.repoTag = repoTag
    }
    
    func getTitleText() -> String {
        return repoTag?.name ?? ""
    }
    
    func getDescriptionText() -> String {
        return repoTag?.commit?.sha ?? ""
    }
}
