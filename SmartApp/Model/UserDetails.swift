//
//  UserDetails.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation

struct UserDetails: Decodable, Identifiable {
    let id: Int
    let login: String?
    let avatar_url: String?
    let name: String?
    let location: String?
    let public_repos: Int
    let followers: Int
    let following: Int
}
