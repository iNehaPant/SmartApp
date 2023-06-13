//
//  MockNetworkManager.swift
//  VSmartTests
//
//  Created by Neha-NewOS on 14/05/2023.
//

import Foundation
import Combine
import Alamofire
@testable import SmartApp


class MockNetworkManager: Network {
    var mockUsers: [User]
    var mockUserDetails: UserDetails

    init(mockUsers: [User] = [User(id: 1, login: "Neha", avatar_url: "Neha")],
         mockUserDetails: UserDetails = UserDetails(id: 0, login: "Neha", avatar_url: "Neha", name: "Neha", location: "Neha", public_repos: 0, followers: 1, following: 1)) {
        self.mockUsers = mockUsers
        self.mockUserDetails = mockUserDetails
    }

    func fetchUserData() -> AnyPublisher<[User], AFError> {
        return Just(mockUsers)
            .setFailureType(to: AFError.self)
            .eraseToAnyPublisher()
    }

    func fetchUserDetails(name: String?) -> AnyPublisher<UserDetails, AFError> {
        return Just(mockUserDetails)
            .setFailureType(to: AFError.self)
            .eraseToAnyPublisher()
    }
}
