//
//  EditProfileDetailView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/12/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var value: String = ""
    
    // Input parameters
    let option: EditProfileOptions
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Enter", text: $value)
                
                Spacer()
                
                // If textField is not empty, show x button
                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Divider()
            
            Text(subTitle)
                .font(.footnote)
                .foregroundStyle(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear {
            self.onViewAppear()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button ("Cancel") {
                    dismiss()
                }
                .tint(.primary)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button ("Save") {
                    dismiss()
                }
                .tint(.primary)
                .fontWeight(.semibold)
            }
        }
    }
}

extension EditProfileDetailView {
    var subTitle: String {
        switch option {
        case .name:
            return "Your full name can only be changed once every 7 days"
        case .username:
            return "Tell us a little bit about yourself"
        case .bio:
            return "Usernames can contain only letters, number, underscores, and periods."
        }
    }
    
    // Create text in TextField when this view appears.
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullname
        case .username:
            value = user.username
        case .bio:
            value = user.bio ?? "Add your bio"
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(option: .username, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
