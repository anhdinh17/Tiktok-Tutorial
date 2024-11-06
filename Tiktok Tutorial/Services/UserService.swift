//
//  UserService.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/5/24.
//

import FirebaseAuth
import FirebaseFirestore

// For using mocking data
protocol UserServiceProtocol {
    func fetchUsers() async throws -> [User]
}

// We can use struct here because it's lightweight and faster
struct UserService: UserServiceProtocol {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            // Create path to set data
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
    
    func fetchUsers() async throws -> [User]  {
        // Go to "users" collection and fetch all users in there
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users
    }
}

struct MockUserService: UserServiceProtocol {
    func fetchUsers() async throws -> [User] {
        // Fetch mocking data
        return DeveloperPreview.users
    }
}
