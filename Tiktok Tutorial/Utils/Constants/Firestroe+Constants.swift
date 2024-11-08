//
//  Firestroe+Constants.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/7/24.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    static let UserCollection = Root.collection("users")
}
