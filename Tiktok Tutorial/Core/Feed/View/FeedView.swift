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
    @State private var scrollPosition: String? // nil when initially launching this View
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id) // Link id to scrollPosition
                        .onAppear {
                            // Play first post's video if neccessary
                            playInitialVideoIfNecessary()
                        }
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
        // Stop the video if we move to other screens or
        // away from this view.
        .onDisappear { player.pause() }
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
    
    /// The reason we want this func is because when we initially launch the app
    /// FeedView's scrollPosition is nil at first => video doesn't play.
    /// "If Necessary" because when we scroll to 2nd post and scroll back to the 1st one, the video plays because
    /// at that time, scrollPosition is not Nil anymore, it will have id of the first post.
    func playInitialVideoIfNecessary() {
        // Check if scrollPostion is nil, which means when we first launch FeedView
        guard scrollPosition == nil,
              let post = viewModel.posts.first, // get the first post
              player.currentItem == nil else { return }
        
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
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
