//
//  NetworkManager.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation
import Combine
import Alamofire

let baseUrl = "https://api.github.com/users"

protocol Network {
    func fetchUserData() -> AnyPublisher<[User], AFError>
    func fetchUserDetails(name: String?) -> AnyPublisher<UserDetails,AFError>
}

struct NetworkManager: Network {
    
    func fetchUserData() -> AnyPublisher<[User], AFError> {
       let url = URL(string: baseUrl)!
       return AF.request(url, method: .get)
          .validate()
          .publishDecodable(type: [User].self)
          .value()
          .receive(on: DispatchQueue.main)
          .eraseToAnyPublisher()
    }

    func fetchUserDetails(name: String?) -> AnyPublisher<UserDetails,AFError> {
        let url = URL(string: baseUrl+"/"+(name ?? ""))!
        return AF.request(url, method: .get)
           .validate()
           .publishDecodable(type: UserDetails.self)
           .value()
           .receive(on: DispatchQueue.main)
           .eraseToAnyPublisher()
    }

}
