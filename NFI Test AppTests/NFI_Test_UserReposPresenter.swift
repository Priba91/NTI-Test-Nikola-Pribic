//
//  NFI_Test_UserReposPresenter.swift
//  NFI Test AppTests
//
//  Created by Nikola Pribic on 31.1.24..
//

import XCTest
import UIKit

final class NFI_Test_UserReposPresenter: XCTestCase {
    
    func test_userRepoPresenter() throws {
        let userRepoPresenter = UserReposPresenter(nil, networkClient: NetworkMockClient())
        userRepoPresenter.fetchData()

        XCTAssertNotNil(userRepoPresenter.getUser(), "User shoud not be nil")
        XCTAssertNotNil(userRepoPresenter.getUserRepos(), "User Repos shoud not be nil")
        XCTAssertNotEqual(userRepoPresenter.getUserRepos().count, 0, "User Repos shoud not be empty")
    }
}
