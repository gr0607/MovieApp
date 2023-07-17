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
    case getMovieDetailsWith(id: Int)
    
    var path: String {
        switch self {
        case .getPopularMovies :
           return "/3/movie/popular"
        case .searchMovieWith:
            return "/3/search/movie"
        case .getMovieDetailsWith(let id):
            return "/3/movie\(id)"
        }
    }
    
    var urlParams: [String : String?] {
        var params = ["api_key":ApiConstants.key]
        switch self {
            case .searchMovieWith(let text):
            params["query"] = text
            case .getPopularMovies:
            print("")
            case  .getMovieDetailsWith(let id):
            print("")
        }
        return params
    }
}


