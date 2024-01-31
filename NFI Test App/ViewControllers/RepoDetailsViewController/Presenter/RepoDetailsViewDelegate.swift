//
//  RepoDetailsViewDelegate.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

protocol RepoDetailsViewDelegate {
    func updateUI(repoTags: [RepoTag]?)
    func showError(error: APIError)
}
