//
//  EditProfileManager.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/13/24.
//

import UIKit
import Firebase
import FirebaseAuth

class EditProfileManager: ObservableObject {
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    
    func uploadProfileImage(_ uiImage: UIImage) async {
        do {
            let profileImageUrl = try await imageUploader.uploadImage(image: uiImage)
            try await updateUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG: Handle image upload error here..")
        }
    }
    
    /// Update current user's profileImageUrl
    /// Go to current user's path and add/update "profileImageUrl" (update if there's already a profileImageUrl)
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        try await FirestoreConstants.UserCollection.document(currentUserId).updateData([
            "profileImageUrl" : imageUrl
        ])
    }
}
