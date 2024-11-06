//
//  PreviewProvider.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/6/24.
//

import Foundation

// Mock data
struct DeveloperPreview {
    static var user = User(id: NSUUID().uuidString,
                           username: "lewis_hamilton",
                           email: "lh@email.com",
                           fullname: "Lewis Hamilton"
    )
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, username: "jaden_scope", email: "js@email.com", fullname: "Jaden Scope"),
        .init(id: NSUUID().uuidString, username: "kaitlin_gaul", email: "kg@email.com", fullname: "Kaitlin Gaul"),
        .init(id: NSUUID().uuidString, username: "john_weak", email: "jw@email.com", fullname: "John Weak"),
        .init(id: NSUUID().uuidString, username: "sam_ng", email: "sn@email.com", fullname: "Sam Ng")
    ]
}
