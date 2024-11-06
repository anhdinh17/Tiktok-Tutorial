//
//  ExploreViewModel.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/6/24.
//

import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    private let userSerivce: UserServiceProtocol // For using mocking data
    
    init(userService: UserServiceProtocol) {
        self.userSerivce = userService
        // Fetch users when init VM
        Task {
            await self.fetchUsers()
        }
    }
    
    func fetchUsers() async {
        do {
            self.users = try await userSerivce.fetchUsers()
        } catch {
            print("DEBUG: Failed to fetch users in ExploreVM: \(error.localizedDescription)")
        }
    }
}
