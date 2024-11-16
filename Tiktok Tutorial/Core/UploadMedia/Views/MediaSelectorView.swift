//
//  MediaSelectorView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 11/16/24.
//

import SwiftUI
import PhotosUI

struct MediaSelectorView: View {
    @State private var showMediaPlayer = false
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .onAppear {
                // Show videos picker when this view appears.
                showMediaPlayer.toggle()
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            // This is an other way to pop up Photo Picker
            // We have one in EditProFileView
            .photosPicker(isPresented: $showMediaPlayer,
                          selection: $selectedItem,
                          matching: .videos)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Next") {
                        print("DEBUG: Go to upload post")
                    }
                }
            }
        }
    }
}

#Preview {
    MediaSelectorView()
}
