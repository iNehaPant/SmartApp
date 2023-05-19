//
//  UserDetailsView.swift
//  VSmart
//
//  Created by Neha-NewOS on 10/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserDetailsView: View {
    @StateObject var viewModel: UserDetailViewModel
    
    var body: some View {
        VStack {
            if let avatarUrl = viewModel.userDetails.avatar_url,
               avatarUrl.count > 0 {
                WebImage(url: URL(string: avatarUrl))
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
            }
            
            VStack {
                if let name = viewModel.userDetails.name {
                    Text(name)
                        .font(.headline)
                }
                if let login =  viewModel.userDetails.login {
                    Text(login.capitalized)
                        .font(.system(size: 15.0))
                }
                
            }
            
            VStack() {
                HStack(spacing: 10) {
                    Image("followers")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                    HStack {
                        Text(String(viewModel.userDetails.followers))
                            .font(.system(size: 12.0, weight: .bold))
                        Text(NSLocalizedString("followers", comment: ""))
                            .font(.system(size: 12.0))
                        
                    }
                    HStack {
                        Text(String(viewModel.userDetails.following))
                            .font(.system(size: 12.0, weight: .bold))
                        Text(NSLocalizedString("following", comment: ""))
                            .font(.system(size: 12.0))
                    }
                }
                HStack {
                    if let location = viewModel.userDetails.location {
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        Text(location)
                            .font(.system(size: 12.0))
                    }
                }
            }
            .padding(20)
            Spacer()
        }
    }
}

