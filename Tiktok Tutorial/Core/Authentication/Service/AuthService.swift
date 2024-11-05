//
//  AuthService.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/3/24.
//

import Foundation
import FirebaseAuth

/** ---NOTE---
 - This class is used for Dependency Injection
 */

@MainActor
class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    // Thằng này chỉ là 1 instance của UserService
    // For now, không view nào có dependencies liên quan tới UserService
    // Nó không dùng để update hay publish properties nào,
    // Nên ta có thể tạo 1 instance và call funcs.
    private let userService = UserService()
    
    // Check if there's a logged in user or not (Nil)
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Login user: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to login user \(error.localizedDescription)")
            // Throw error here, now func is "throws"
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession =  result.user // Get user or nil
            try await uploadUserData(withEmail: email, id: result.user.uid, username: username, fullname: fullname)
            print("DEBUG: Create user: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user \(error.localizedDescription)")
            // Throw error here, now func is "throws"
            throw error
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut() // Sign out on backend
            self.userSession = nil // Updates routing logic by wiping userSession
        } catch {
            print("DEBUG: Failed to sign out")
        }
    }
    
    private func uploadUserData(withEmail email: String,
                                id: String,
                                username: String,
                                fullname: String) async throws {
        let user = User(id: id, username: username, email: email, fullname: fullname)
        try await userService.uploadUserData(user)
    }
}
