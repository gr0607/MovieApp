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
    
    enum CodingKeys: String, CodingKey {
           case  genres, id, overview, popularity
           case posterPath = "poster_path"
           case  runtime, title
       }
}



struct Genre: Codable {
    let id: Int?
    let name: String?
}
