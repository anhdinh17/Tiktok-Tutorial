//
//  RegistrationViewModel.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/3/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    private let authService: AuthService
    
    // Using Dependency Injection
    // For the Messeneger App, he uses Singleton
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullname: String) async {
        do {
            try await authService.createUser(withEmail: email,
                                             password: password,
                                             username: username,
                                             fullname: fullname)
        } catch {
            print("DEBUG: Failed login with error: \(error.localizedDescription)")
        }
    }
}
