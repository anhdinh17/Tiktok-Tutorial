//
//  ExploreView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/30/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0 ..< 20) { user in
                        UserCell()
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExploreView()
}
