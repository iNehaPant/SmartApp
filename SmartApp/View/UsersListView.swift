//
//  ContentView.swift
//  VSmart
//
//  Created by Neha-NewOS on 09/05/2023.
//

import SwiftUI
import Combine

struct UsersListView: View {
    @StateObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.users) { user in
                    HStack(alignment: .top) {
                        NavigationLink(destination:
                                        UserDetailsView(viewModel: UserDetailViewModel(networkManager: self.viewModel.networkManager, servicePathName: user.login))){
                            if let avatarUrl = user.avatar_url,
                               avatarUrl.count > 0 {
                                SDImageView(url: URL(string: avatarUrl)!)
                            }
                            Text(user.login.capitalized)
                                .font(.headline)
                        }
                    }
                }
                .refreshable {
                    viewModel.fetchUserData()
                }
                .alert(NSLocalizedString("noInternet", comment: ""), isPresented: $viewModel.showAlert) {
                    Button(NSLocalizedString("ok", comment: ""), role: .cancel) { }
                }
            }
            .navigationTitle(NSLocalizedString("users", comment: ""))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(viewModel: UserViewModel(networkManager: NetworkManager()))
    }
}
