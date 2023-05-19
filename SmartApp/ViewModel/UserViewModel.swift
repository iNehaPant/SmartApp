//
//  UserViewModel.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var showAlert = false
    var networkManager: Network
    var subscriber = Set<AnyCancellable>()
    let reachability = Reachability()

    init(networkManager: Network) {
        self.networkManager = networkManager
        self.fetchUserData()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reachabilityDidChange),
            name: NSNotification.Name(rawValue: ReachabilityStatusChangedNotification),
            object: nil)
    }

    //get user data
    func fetchUserData() {
        self.networkManager.fetchUserData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    self.showAlert = true
                    print(error.localizedDescription)
                }
            }, receiveValue: {[weak self] users in
                guard let strongSelf = self else {return}
                strongSelf.users = users
            })
            .store(in: &subscriber)
    }

    @objc func reachabilityDidChange(_ notification: Notification) {
        let reachability = notification.object as! Reachability
        if reachability.isReachable() {
            self.fetchUserData()
        } else {
        }
    }
}


