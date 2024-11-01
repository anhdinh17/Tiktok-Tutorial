//
//  FeedView.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/30/24.
//

import SwiftUI
import AVKit
/** ---NOTE---
 - Whatever related to AVPlayer is to play video
 */
struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id) // Link id to scrollPosition
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            player.play()
            // Play video when this ScrollView appears
            // I think we combine this with stuff in .onChange
            // so that everytime we scroll, the video of new post plays.
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        
        // Everytime we scroll, we have the id of the post passed to FeedCell
        // We have it because we set .id for FeedCell
        // Also, we play new video from new post.
        .onChange(of: scrollPosition) { oldValue, newValue in
            print("DEBUG: Scroll postion is \(newValue)")
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }
    // .scrollTargetLayout and .scrollTargetBehavior make paging effect
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId}) else { return }
        
        // player erases the previous video
        // and play new video from current post
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
