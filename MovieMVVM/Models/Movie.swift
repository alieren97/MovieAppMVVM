//
//  TrendingMovie.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import Foundation

import Foundation

// MARK: - Movie
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
}

// MARK: - Result
struct Movie: Codable,Identifiable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath : String?
    let releaseDate :String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var posterURL : URL{
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var backdropURL : URL{
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
