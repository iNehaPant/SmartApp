//
//  MockNetworkManager.swift
//  VSmartTests
//
//  Created by Neha-NewOS on 14/05/2023.
//

import Foundation
import Alamofire
import Combine
@testable import VSmart


class MockNetworkManager: Network {
    var mockUsers: [User]
    var mockUserDetails: UserDetails

    init(mockUsers: [User] = [],
         mockUserDetails: UserDetails = UserDetails(id: 0, login: "", avatar_url: "", name: "", location: "", public_repos: 0, followers: 1, following: 1)) {
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
