//
//  MovieRequest.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//

import Foundation

enum MoviesRequest: RequestProtocol {
    case searchMovieWith(text: String)
    case getPopularMovies
    
    var path: String {
        switch self {
        case .getPopularMovies :
           return "/3/movie/popular"
        case .searchMovieWith:
            return "/3/search/movie"
        }
    }
    
    var urlParams: [String : String?] {
        var params = ["api_key":APIConstants.key]
        switch self {
            case .searchMovieWith(let text):
            params["query"] = text
            case .getPopularMovies:
            print("")
        }
        return params
    }
}


