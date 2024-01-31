//
//  UserReposViewDelegate.swift
//  NFI Test App
//
//  Created by Nikola Pribic on 30.1.24..
//

import Foundation

protocol UserReposViewDelegate {
    func updateUI(repos: [Repo]?)
    func showError(error: APIError)
}
