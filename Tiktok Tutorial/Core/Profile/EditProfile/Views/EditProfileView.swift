//
//  EditProfileView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/9/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    // This guy is for the binding with PhotosPicker()
    // What we select will bind to this one.
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    
    var body: some View {
        NavigationStack {
            VStack {
                // When we select a photo, selectedPickerItem changes.
                // -> .task(id:) triggers its body.
                // -> profileImage gets image and displays.
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        Text("Change Photo")
                            .foregroundStyle(.black)
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .foregroundStyle(Color(.systemGray2))
                    
                    EditProfileOptionRowView(option: EditProfileOptions.name,
                                  value: "Lewis Hamilton")
                    EditProfileOptionRowView(option: EditProfileOptions.username,
                                  value: "@lewis_hamilton")
                    EditProfileOptionRowView(option: EditProfileOptions.bio,
                                  value: "F1 driver")
                }
                .fontWeight(.semibold)
                .padding()
                
                Spacer()
            }
            // When selectedPickerItem changes (we select a Photo),
            // this .task triggers
            .task(id: selectedPickerItem) {
                await self.loadImage(fromItem: selectedPickerItem)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: EditProfileOptions.self, destination: { option in
                Text(option.title)
            })
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

extension EditProfileView {
    // Get image from PickerItem
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}

#Preview {
    EditProfileView()
}

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    
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
