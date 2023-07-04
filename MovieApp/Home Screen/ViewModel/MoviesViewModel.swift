//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by admin on 04.07.2023.
//

import Foundation

class MoviesViewModel {
    
    let requestManager = RequestManager()
    let popularMovieRequest = MoviesRequest.getPopularMovies
    
    private var moviesStore: [Movie]? {
        didSet {
            print("DEBUG", moviesStore!.count)
        }
    }
    
    
    func fetchMovies() {
        requestManager.perform(popularMovieRequest) { (movies: Movies?) in
           guard let movies = movies else { return }
           self.moviesStore = movies.results
        }
    }
    
    func getCountOfMovies() -> Int {
        guard let moviesStore = moviesStore else { return 0}
        return moviesStore.count
    }
}

