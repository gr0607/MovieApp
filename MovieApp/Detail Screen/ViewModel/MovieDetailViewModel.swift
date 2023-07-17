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
    
    
    func fetchMovieDetailWith(id: Int) {
        let request = MoviesRequest.getMovieDetailsWith(id: id)
        
        requestManager.perform(request) { (movieDetail: MovieDetail?) in
            print(movieDetail?.title, movieDetail?.runtime)
        }
    }
}
