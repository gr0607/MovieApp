//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by admin on 04.07.2023.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    let requestManager = RequestManager()
    let popularMovieRequest = MoviesRequest.getPopularMovies
    
    @Published var moviesStore: [Movie]?
    
    
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
    
    func getMovieViewModelByIndex(_ index: Int) -> MovieViewModel? {
        guard let moviesStore = moviesStore else { return nil}
        let movie = moviesStore[index]
        return MovieViewModel(movie: movie)
    }
    
}

