//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by admin on 17.07.2023.
//

import Foundation
import Combine

class MovieDetailViewModel {
    
    let requestManager = RequestManager()
    
    @Published var movieDetail: MovieDetail?
    
    var imageUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/original\(movieDetail?.posterPath ?? "")")
    }
    
    var title: String {
        movieDetail?.title ?? "Title"
    }
    
    var timeText: String {
        "\(movieDetail?.runtime ?? 150) minutes"
    }
    
    var ratingText: String {
        String(format: "%.1f (IMDB)", movieDetail?.voteAverage ?? 7.2)
    }
    
    var genreOne: String {
        movieDetail?.genres?.first?.name ?? "pipipi"
    }
    
    var genreTwo: String {
        movieDetail?.genres?[1].name ?? "Comedy"
    }
    
    var about: String {
        movieDetail?.overview ?? "About Film"
    }
    
    func fetchMovieDetailWith(id: Int?) {
        guard let id = id else { return }
        let request = MoviesRequest.getMovieDetailsWith(id: id)
        requestManager.perform(request) { (movieDetail: MovieDetail?) in
            self.movieDetail = movieDetail
            print("MOVIEWDETA", movieDetail)
        }
    }
}
