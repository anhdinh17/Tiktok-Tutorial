//
//  EditProfileView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/9/24.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Circle()
                        .frame(width: 64, height: 64)
                    
                    Button {
                        
                    } label: {
                        Text("Change Photo")
                            .foregroundStyle(.black)
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .foregroundStyle(Color(.systemGray2))
                    
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text("Lewis Hamilton")
                    }
                    
                    HStack {
                        Text("Username")
                        
                        Spacer()
                        
                        Text("@lewis_hamilton")
                    }
                    
                    HStack {
                        Text("Bio")
                        
                        Spacer()
                        
                        Text("Add a bio")
                    }
                }
                .fontWeight(.semibold)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
