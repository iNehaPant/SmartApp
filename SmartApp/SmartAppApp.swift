//
//  SmartAppApp.swift
//  SmartApp
//
//  Created by Neha-NewOS on 19/05/2023.
//

import SwiftUI

@main
struct SmartAppApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView(viewModel: UserViewModel(networkManager: NetworkManager()))
        }
    }
}
