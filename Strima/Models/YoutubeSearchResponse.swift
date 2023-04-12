//
//  YoutubeSearchResponse.swift
//  Strima
//
//  Created by GO on 3/28/23.
//

import Foundation

// MARK: - YoutubeSearchResponse
struct YoutubeSearchResponse: Codable {
    let items: [VideosElement]
}

// MARK: - Item
struct VideosElement: Codable {
    let id: IdVideoElement
}

// MARK: - ID
struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
