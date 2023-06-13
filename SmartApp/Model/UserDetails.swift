//
//  UserDetails.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation

struct UserDetails: Decodable, Identifiable, Equatable {
    let id: Int
    let login: String?
    let avatar_url: String?
    let name: String?
    let location: String?
    let public_repos: Int
    let followers: Int
    let following: Int

    static func ==(lhs: UserDetails, rhs: UserDetails) -> Bool {
        return lhs.id == rhs.id
        && lhs.login == rhs.login
        && lhs.avatar_url == rhs.avatar_url
        && lhs.name == rhs.name
        && lhs.location == rhs.location
        && lhs.public_repos == rhs.public_repos
        && lhs.followers == rhs.followers
        && lhs.following == rhs.following
    }
}
