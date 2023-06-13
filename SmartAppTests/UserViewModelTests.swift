//
//  UserViewModelTests.swift
//  VSmartTests
//
//  Created by Neha-NewOS on 12/05/2023.
//

import XCTest

import XCTest
import Combine
import Alamofire
@testable import SmartApp


final class UsersViewModelTests: XCTestCase {
    var sut: UserViewModel!
    var mockNetworkManager: MockNetworkManager!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        sut = UserViewModel(networkManager: mockNetworkManager)
    }

    override func tearDown() {
        sut = nil
        mockNetworkManager = nil
        super.tearDown()
    }

    func testFetchUserData() {
        // Given
        let expectedUsers = [User(id: 1, login: "Neha", avatar_url: "Neha")]

        let expectation = self.expectation(description: "fetchUserData")

        // When
        sut.fetchUserData()

        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.users, expectedUsers)
            expectation.fulfill()
        }

        // Then
        self.wait(for: [expectation], timeout: 1.0)
    }
}

