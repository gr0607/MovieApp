//
//  MovieDetail.swift
//  MovieApp
//
//  Created by admin on 17.07.2023.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int?
    let genres: [Genre]?
    let popularity: Double?
    let runtime: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
           case  genres, id, overview, popularity
           case posterPath = "poster_path"
           case  runtime, title
           case voteAverage = "vote_average"
           case releaseDate = "release_date"
       }
}



struct Genre: Codable {
    let id: Int?
    let name: String?
}
