//
//  User.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let login: String
    let avatar_url: String
}
