//
//  EditProfileOptions.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/12/24.
//

import Foundation

enum EditProfileOptions: Hashable {
    case name
    case username
    case bio
    
    var title: String {
        switch self {
        case .name:
            return "Name"
        case .username:
            return "Username"
        case .bio:
            return "Bio"
        }
    }
}
