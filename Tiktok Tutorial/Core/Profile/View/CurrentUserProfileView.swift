//
//  CurrentUserProfileView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/31/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Profile Header
                    ProfileHeaderView()
                    
                    // Post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
