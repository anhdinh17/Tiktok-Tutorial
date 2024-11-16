//
//  UserCell.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/30/24.
//

import SwiftUI

struct UserCell: View {
    // Take in a User
    let user: User
    
    var body: some View {
        HStack {
            AvatarView(user: user, size: .medium)
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
