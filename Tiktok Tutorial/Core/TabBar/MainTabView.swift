//
//  MainTabView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/29/24.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = 0
    // Dependency Injection
    let authService: AuthService
    let user: User // current user
    
    init(authService: AuthService, user: User) {
        self.authService = authService
        self.user = user
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            // it's syntax for selecting a tab and make it fill
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
            // .onAppear and .tag are to make the image fill when selecting a tab and
            // not fill when we select other tab
            // combining with logic in VStack
                .onAppear{ selectedTab = 0}
                .tag(0)
            
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Friends")
                    }
                }
                .onAppear{ selectedTab = 1}
                .tag(1)
            
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus")
                }
            
            NotificationView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Inbox")
                    }
                }
                .onAppear{ selectedTab = 3}
                .tag(3)
            
            CurrentUserProfileView(authService: authService, user: user)
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .onAppear{ selectedTab = 4}
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(authService: AuthService(),
                user: DeveloperPreview.user)
}
