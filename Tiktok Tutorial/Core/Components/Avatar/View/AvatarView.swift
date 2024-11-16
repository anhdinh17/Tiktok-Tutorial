//
//  AvatarView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/14/24.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    // Take in a User
    let user: User?
    // Add size to instance
    let size: AvatarSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    VStack {
        AvatarView(user: DeveloperPreview.user, size: .xLarge)
        AvatarView(user: DeveloperPreview.user, size: .large)
        AvatarView(user: DeveloperPreview.user, size: .medium)
        AvatarView(user: DeveloperPreview.user, size: .small)
        AvatarView(user: DeveloperPreview.user, size: .xSmall)
    }
}
