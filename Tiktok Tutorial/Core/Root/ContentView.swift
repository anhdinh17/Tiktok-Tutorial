//
//  ContentView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(authService: AuthService())
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
