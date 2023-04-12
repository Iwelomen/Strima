//
//  Movie.swift
//  Strima
//
//  Created by GO on 3/27/23.
//


/*
 {
 "adult": false,
 "backdrop_path": "/i8dshLvq4LE3s0v8PrkDdUyb1ae.jpg",
 "id": 603692,
 "title": "John Wick: Chapter 4",
 "original_language": "en",
 "original_title": "John Wick: Chapter 4",
 "overview": "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
 "poster_path": "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
 "media_type": "movie",
 "genre_ids": [
 28,
 53,
 80
 ],
 "popularity": 3734.86,
 "release_date": "2023-03-22",
 "video": false,
 "vote_average": 8.281,
 "vote_count": 334
 },
 
 */

import Foundation

struct TendingTitlesResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_count: Int
    let vote_average: Double
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tendingMoviesResponse = try? JSONDecoder().decode(TendingMoviesResponse.self, from: jsonData)

//import Foundation
//
//// MARK: - TendingMoviesResponse
//struct TendingMoviesResponse: Codable {
//    let page: Int
//    let results: [Movie]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//// MARK: - Result
//struct Movie: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let id: Int
//    let title, originalLanguage, originalTitle, overview: String
//    let posterPath: String
//    let mediaType: MediaType
//    let genreIDS: [Int]
//    let popularity: Double
//    let releaseDate: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case id, title
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview
//        case posterPath = "poster_path"
//        case mediaType = "media_type"
//        case genreIDS = "genre_ids"
//        case popularity
//        case releaseDate = "release_date"
//        case video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//enum MediaType: String, Codable {
//    case movie = "movie"
//    case tv = "tv"
//}
