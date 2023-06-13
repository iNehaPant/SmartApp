//
//  UserDetailsViewModelTests.swift
//  SmartAppTests
//
//  Created by Neha-NewOS on 13/06/2023.
//

import XCTest
@testable import SmartApp

final class UserDetailsViewModelTests: XCTestCase {
    var sut: UserDetailViewModel!
    var network: MockNetworkManager!

    override func setUp() {
        network = MockNetworkManager()
        sut = UserDetailViewModel(networkManager: network, servicePathName: "/abc")
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_fetchUserDetails() {
        //given
        let expectedUserDetails = UserDetails(id: 0, login: "Neha", avatar_url: "Neha", name: "Neha", location: "Neha", public_repos: 0, followers: 1, following: 1)
        let expectation = expectation(description: "fetch user details")

        //when
        sut.fetchUserDetails()

        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.userDetails, expectedUserDetails)
            expectation.fulfill()
        }

        //then
        wait(for: [expectation], timeout: 5.0)
    }

}
