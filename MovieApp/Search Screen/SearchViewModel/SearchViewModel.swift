//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by admin on 07.07.2023.
//

import Foundation
import Combine

class SearchViewModel {
    let requestManager = RequestManager()
    
    @Published var moviesStore: [Movie]?
    
    var genreId = 28 {
        didSet {
            fetchMoviesWith(searchText, genreId)
        }
    }
    
    var searchText = "A" {
        didSet {
            fetchMoviesWith(searchText, genreId)
        }
    }
    
    init() {
       fetchMoviesWith(searchText, genreId)
    }
    
    
    func getNumberOfRows() -> Int{
        return moviesStore?.count ?? 0
    }
    
    func getMoviewVieModelByIndex(_ index: Int) -> MovieViewModel? {
        guard let moviesStore = moviesStore else { return nil}
        return MovieViewModel(movie: moviesStore[index])
    }
    
    private func fetchMoviesWith(_ searchText: String, _ genreId: Int) {
        let request = MoviesRequest.searchMovieWith(text: searchText)
        requestManager.perform(request) { (movies: Movies?) in
            guard let movies = movies else { return }
            
            let selected = movies.results?.filter({ movie in
                return movie.genreIDS.contains(genreId)
            })
            
            self.moviesStore = selected
        }
    }
}

