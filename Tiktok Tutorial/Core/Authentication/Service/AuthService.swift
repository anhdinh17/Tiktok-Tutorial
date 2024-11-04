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

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    // Check if there's a logged in user or not (Nil)
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email: \(email)")
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Create user: \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user \(error.localizedDescription)")
            // Throw error here, now func is "throws"
            throw error
        }
    }
    
    func signout() {
        
    }
    
}
