//
//  NFI_Test_RepoDetailsPresenter.swift
//  NFI Test AppTests
//
//  Created by Nikola Pribic on 31.1.24..
//

import XCTest

final class NFI_Test_RepoDetailsPresenter: XCTestCase {
    
    func test_userRepoPresenter() throws {
        let userRepoPresenter = UserReposPresenter(nil, networkClient: NetworkMockClient())
        userRepoPresenter.fetchData()

        let repoDetailsPresenter = RepoDetailsPresenter(view: nil, networkClient: NetworkMockClient(), presentedRepo: userRepoPresenter.getUserRepos().first!, user: nil)
        repoDetailsPresenter.fetchRepoDetails()

        XCTAssertNotNil(repoDetailsPresenter.getRepoTags(), "Repo tags shoud not be nil")
        XCTAssertNotNil(repoDetailsPresenter.repoDetails, "Repo details shoud not be nil")
        XCTAssertEqual(repoDetailsPresenter.getRepoTags().count, 30, "Mock Repo tags should have 30 elements.")
    }
}
