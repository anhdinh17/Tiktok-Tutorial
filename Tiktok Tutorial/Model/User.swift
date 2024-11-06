//
//  User.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/5/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    // Có hoặc không có bio và profileImageurl
    var bio: String?
    var profileImageUrl: String?
}

// For NavigationLink(value:)
extension User: Hashable { }
