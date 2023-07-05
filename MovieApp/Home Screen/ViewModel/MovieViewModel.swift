//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by admin on 05.07.2023.
//

import Foundation
import UIKit
import SDWebImage

class MovieViewModel {
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var name: String {
        movie.originalTitle ?? "NoName"
    }
    
    var imageUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath!)")
    }
    
    var rating: String {
        String(movie.voteAverage ?? 7.0)
    }
    
}
