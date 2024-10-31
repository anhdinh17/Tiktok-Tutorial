//
//  PostGridView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/31/24.
//

import SwiftUI

struct PostGridView: View {
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible())
    ]
    
    // Calculate the width of each cell
    // - 2 de co space between each cell, moi side của 1 cell thêm 1
    private let width = UIScreen.main.bounds.width/3 - 2
    
    var body: some View {
        VStack {
            // The spacing fo LazyVGrid is between rows
            LazyVGrid(columns: items, spacing: 2) {
                ForEach(0 ..< 25){ post in
                    Rectangle()
                        .frame(width: width, height: 160)
                        .clipped()
                }
            }
        }
    }
}

#Preview {
    PostGridView()
}
