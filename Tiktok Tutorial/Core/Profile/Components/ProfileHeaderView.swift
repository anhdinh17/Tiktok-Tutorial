//
//  ProfileHeaderView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/31/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    
    // Take in a User
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                // Profile Image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                // Username
                Text("@\(user.username)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            // Stats
            HStack(spacing: 16) {
                UserStatView(value: 5, title: "Followings")
                UserStatView(value: 1, title: "Followers")
                UserStatView(value: 7, title: "Likes")
            }
            
            // Action Button
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    // Bo cai dong frame vo cho Text cung duoc
            }
            .frame(width: 360, height: 32)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.user)
}
