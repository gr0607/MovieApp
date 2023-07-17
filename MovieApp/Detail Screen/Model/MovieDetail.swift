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
    let posterPath: String?
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}
