//
//  FeedViewModel.swift
//  Tiktok Tutorial
//
//  Created by Anh Dinh on 10/31/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoUrls = [
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
    ]
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: UUID().uuidString, videoUrl: videoUrls[0]),
            .init(id: UUID().uuidString, videoUrl: videoUrls[1]),
            .init(id: UUID().uuidString, videoUrl: videoUrls[2]),
            .init(id: UUID().uuidString, videoUrl: videoUrls[3]),
        ]
    }
}
