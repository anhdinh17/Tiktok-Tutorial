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
    
    init(authService: AuthService) {
        self.authService = authService
        self._viewModel = StateObject(wrappedValue: ContentViewModel(authService: authService))
    }
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView(authService: authService)
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
