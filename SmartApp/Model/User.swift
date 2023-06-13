//
//  User.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    let id: Int
    let login: String
    let avatar_url: String

    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
        && lhs.login == rhs.login
        && lhs.avatar_url == rhs.avatar_url
    }
}
