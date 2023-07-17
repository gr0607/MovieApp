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
    
    
    func fetchMovieDetailWith(id: Int?) {
        guard let id = id else { return }
        let request = MoviesRequest.getMovieDetailsWith(id: id)
        print("REQUEST", request)
        print("HERE DETAIL")
        requestManager.perform(request) { (movieDetail: MovieDetail?) in
            self.movieDetail = movieDetail
        }
    }
}
