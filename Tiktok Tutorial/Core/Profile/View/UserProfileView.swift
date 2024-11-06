//
//  UserProfileView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/6/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                // Profile Header
                ProfileHeaderView(user: user)
                
                // Post grid view
                PostGridView()
            }
            .padding(.top)
        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
