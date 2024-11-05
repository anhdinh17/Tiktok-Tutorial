//
//  UserService.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/5/24.
//

import FirebaseAuth
import FirebaseFirestore

// We can use struct here because it's lightweight and faster
struct UserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            // Create path to set data
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
}
