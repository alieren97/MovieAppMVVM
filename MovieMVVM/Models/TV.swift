//
//  TV.swift
//  MovieMVVM
//
//  Created by Ali Eren on 15.02.2022.
//

import Foundation

// MARK: - Tv
struct TvResponse: Codable {
    let page: Int
    let results: [TV]
}

// MARK: - Result
struct TV: Codable,Identifiable {
    let backdropPath: String?
    let firstAirDate: String
    let genreIDS: [Int]
    let id: Int
    let name: String
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Int
    
    var posterURL : URL{
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var backdropURL : URL{
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }


    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

