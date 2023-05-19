//
//  UserDetailViewModel.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation
import Combine

class UserDetailViewModel: ObservableObject {

    @Published var userDetails = UserDetails(id: 0, login: "", avatar_url: "", name: "", location: "", public_repos: 0, followers: 0, following: 0)
    var networkManager: Network
    var subscriber = Set<AnyCancellable>()
    var servicePathName: String?

    init(networkManager: Network, servicePathName: String?) {
        self.networkManager = networkManager
        self.servicePathName = servicePathName
        self.fetchUserDetails()
    }

    func fetchUserDetails() {
        self.networkManager.fetchUserDetails(name: servicePathName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: {[weak self] userDetails in
                guard let strongSelf =  self else {return}
                print(userDetails)
                strongSelf.userDetails  = userDetails
            })
            .store(in: &subscriber)
    }
}
