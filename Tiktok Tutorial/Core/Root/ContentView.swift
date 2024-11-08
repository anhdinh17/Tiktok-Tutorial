//
//  ContentView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    
    // Dependency Injection
    private let authService: AuthService
    private let userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        self._viewModel = StateObject(wrappedValue: ContentViewModel(authService: authService, userService: userService))
    }
    
    var body: some View {
        Group {
            if viewModel.userSession != nil
            {
                if let currentUser = viewModel.currentUser {
                    MainTabView(authService: authService, user: currentUser)
                }
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService(), userService: UserService())
}
