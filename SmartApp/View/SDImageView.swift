//
//  SDImageView.swift
//  VSmart
//
//  Created by Neha-NewOS on 11/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDImageView: View {
    var url: URL

    var body: some View {
        WebImage(url: url)
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .indicator(.activity)
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Rectangle())

    }
}

