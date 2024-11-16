//
//  ExploreView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/30/24.
//

import SwiftUI

struct ExploreView: View {
    // It's ok to create an instance of UserService and pass to VM once this screen displayed.
    // Because as of now, UserService doesn't have any properties to publish changes which
    // other screens/views are dependent on.
    @StateObject var viewModel = ExploreViewModel(userService: UserService())
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        // Each UserCell is a NavLink
                        // Click on this and go to UserProfileView
                        NavigationLink(value: user) {
                            UserCell(user: user)
                        }
                    }
                }
            }
            //MARK: - navigate to a user's profile view
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
