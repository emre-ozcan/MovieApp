//
//  Movie.swift
//  MovieApp
//
//  Created by Emre Özcan on 30.03.2022.
//

import Foundation

struct Movie: Codable{
    
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let image: String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbId"
        case type = "Type"
        case image = "Poster"
    }
}

struct MovieList: Codable{
    let movies : [Movie]
    
    private enum CodingKeys: String, CodingKey{
        case movies = "Search"
    }
}
