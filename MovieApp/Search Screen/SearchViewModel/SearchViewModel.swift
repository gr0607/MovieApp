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
    
    var searchId = 0
    var searchText = ""
    
    init() {
       fetchMoviesWith(searchText)
    }
    
   
    
    func getNumberOfRows() -> Int{
        return moviesStore?.count ?? 0
    }
    
    func getMoviewVieModelByIndex(_ index: Int) -> MovieViewModel? {
        guard let moviesStore = moviesStore else { return nil}
        return MovieViewModel(movie: moviesStore[index])
    }
    
    func fetchMoviesWith(_ searchText: String) {
        let request = MoviesRequest.searchMovieWith(text: searchText)
        print(request)
        requestManager.perform(request) { (movies: Movies?) in
            guard let movies = movies else { return }
            self.moviesStore = movies.results
        }
    }
    
}
