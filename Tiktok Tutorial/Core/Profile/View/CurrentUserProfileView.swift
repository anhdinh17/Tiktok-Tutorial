//
//  CurrentUserProfileView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/31/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    // Dependency Injection to use AuthService
    let authService: AuthService
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Profile Header
                    ProfileHeaderView(user: DeveloperPreview.user)
                    
                    // Post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        authService.signout()
                    } label: {
                        Text("Sign Out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService())
}
