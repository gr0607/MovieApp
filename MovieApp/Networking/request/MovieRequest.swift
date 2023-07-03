//
//  MovieRequest.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//

import Foundation

enum MoviesRequest: RequestProtocol {
case getPopularMovies
    
    var path: String {
        "/3/movie/popular"
    }
    
    var urlParams: [String : String?] {
        var params = ["key":APIConstants.key]
        return params
    }
}
