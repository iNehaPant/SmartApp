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

@testable import VSmart


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
        let expectedUsers = [User(id: 1, login: "Neha", avatar_url: "Neha"), User(id: 2, login: "Neha1", avatar_url: "Neha1")]
        mockNetworkManager.mockUsers = expectedUsers
        let expectation = self.expectation(description: "fetchUserData")

        // When
        sut.networkManager.fetchUserData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Failed with error: \(error.localizedDescription)")
                case .finished:
                    expectation.fulfill()
                }
            }, receiveValue: { users in
                guard let login = users.first?.login else {return}
                    XCTAssertEqual(login, "Neha")
            })
            .store(in: &cancellables)

        // Then
        self.wait(for: [expectation], timeout: 1.0)
    }
}
