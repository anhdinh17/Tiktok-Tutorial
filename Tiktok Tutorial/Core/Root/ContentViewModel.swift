//
//  ContentViewModel.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/3/24.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    // Keep track of whether or not if someone is logged in
    @Published var userSession: FirebaseAuth.User?
    
    // Take in an AuthService object / Dependency Injection
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    // Dependency Injection
    init(authService: AuthService) {
        self.authService = authService
        setupSubscriber()
        authService.updateUserSession()
    }
    
    func setupSubscriber() {
        // Listen to userSession of AuthService
        authService.$userSession
            .sink { [weak self] user in
                // Get user or nil and publish to ContentView
                self?.userSession = user
            }
            .store(in: &cancellables)
    }
    
}
