//
//  EditProfileView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/9/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    // This guy is for the binding with PhotosPicker()
    // What we select will bind to this one.
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    
    // Take in an instance of ImageUploader().
    // This instance is just to run funcs, nothing special or publishing anything.
    @StateObject private var manager = EditProfileManager(imageUploader: ImageUploader())
    
    // Input parameter
    let user: User
    
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
                                             value: user.fullname)
                    EditProfileOptionRowView(option: EditProfileOptions.username,
                                             value: user.username)
                    EditProfileOptionRowView(option: EditProfileOptions.bio,
                                             value: user.bio ?? "Add your bio")
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
            // Dựa vào enum mà hiển thị View sử dụng properties của enum.
            .navigationDestination(for: EditProfileOptions.self) { option in
                EditProfileDetailView(option: option, user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        onDoneTapped()
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
        // make sure to have this one so we can use uiImage in onDoneTapped()
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            await manager.uploadProfileImage(uiImage)
            dismiss()
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}
