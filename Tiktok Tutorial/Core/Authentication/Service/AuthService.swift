//
//  AuthService.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/3/24.
//

import Foundation

/** ---NOTE---
 - This class is used for Dependency Injection
 */

class AuthService {
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Login with email: \(email)")
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String,
                    fullname: String) async throws {
        print("DEBUG: Sign up with email: \(email), username: \(username), fullname: \(fullname)")
    }
    
    func signout() {
        
    }
    
}
