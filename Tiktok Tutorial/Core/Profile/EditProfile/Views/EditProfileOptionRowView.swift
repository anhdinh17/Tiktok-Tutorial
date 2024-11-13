//
//  EditProfileOptionRowView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/12/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    
    // This view is a NavLink 
    var body: some View {
        // Take in an enum
        NavigationLink(value: option) {
            HStack {
                Text(option.title)
                
                Spacer()
                
                Text(value)
            }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    EditProfileOptionRowView(option: .username, value: "Add your something")
}
