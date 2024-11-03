//
//  LoginViewModel.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/3/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    private let authService: AuthService
    
    // Using Dependency Injection
    // For the Messeneger App, he uses Singleton
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed login with error: \(error.localizedDescription)")
        }
    }
}
