//
//  ImageUploader.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/13/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    /// Upload a UIImage to FirebaseStorage
    /// Return String? so that we can use the String to upload to FirebaseFirestore.
    // This func already handles error, we can obmit the throws.
    func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let fileName = UUID().uuidString // Create an Id for image
        // Path of image
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL() // get url of image we just upload to Storage
            return url.absoluteString
        } catch {
            print("DEBUG:")
            return nil
        }
    }
}
