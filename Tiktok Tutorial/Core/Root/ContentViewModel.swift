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
    @Published var currentUser: User?
    
    // Take in an AuthService object / Dependency Injection
    private let authService: AuthService
    // Dependency Injection
    private let userService: UserService
    
    private var cancellables = Set<AnyCancellable>()
    
    // Dependency Injection
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        setupSubscriber()
        
        // Check if there's a logged in user
        authService.updateUserSession()
    }
    
    func setupSubscriber() {
        // Listen to userSession of AuthService
        authService.$userSession
            .sink { [weak self] user in
                // Get user or nil and publish to ContentView
                self?.userSession = user
                
                // Get current user
                // Place the function here. Let's think about this
                // When users sign in, create new account, sign out, launch the app.
                // userSession from AuthService will change and it will publish to here.
                // So in any cases, this func will be called to get current user's info.
                // This place is best place for this func.
                self?.fetchCurrentUser()
            }
            .store(in: &cancellables)
    }
    
    func fetchCurrentUser() {
        // If userSession = nil meaning no user logged in,
        // then we get out of this func.
        guard userSession != nil else { return }
        Task {
            self.currentUser = try await userService.fetchCurrentUser()
        }
    }
    
}
