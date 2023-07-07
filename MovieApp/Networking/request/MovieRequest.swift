//
//  MovieRequest.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//

import Foundation

enum MoviesRequest: RequestProtocol {
    case searchActionMovieWith(text: String)
    case searchCartoonsWith(text: String)
    case searchDocumentarWith(text: String)
    case searchHorrorMoviesWith(text: String)
    case getPopularMovies
    
    var path: String {
        switch self {
        case .getPopularMovies :
           return "/3/movie/popular"
        default:
            return "/3/discover/movie"
        }
    }
    
    var urlParams: [String : String?] {
        var params = ["api_key":APIConstants.key]
        switch self {
            case .searchActionMovieWith(let text):
            params["with_genres"] = "28"
            params["with_keywords"] = text
            case .searchCartoonsWith(let text):
            params["with_genres"] = "16"
            params["with_keywords"] = text
            case .searchHorrorMoviesWith(let text):
            params["with_genres"] = "27"
            params["with_keywords"] = text
            case .searchDocumentarWith(let text):
            params["with_genres"] = "99"
            params["with_keywords"] = text
            case .getPopularMovies:
            print("")
        }
        return params
    }
}

extension MoviesRequest: RawRepresentable {
    typealias RawValue = Int
     
    init?(rawValue: Int){
          switch rawValue {
          case 0 : self = .searchActionMovieWith(text: "")
          case 1 : self = .searchCartoonsWith(text: "")
          case 2 : self = .searchDocumentarWith(text: "")
          case 3 : self = .searchHorrorMoviesWith(text: "")
          case 4 : self = .getPopularMovies
          default : return nil
          }
      }
      
      var rawValue: Int {
          switch self {
          case .searchActionMovieWith: return 0
          case .searchCartoonsWith:  return 1
          case .searchDocumentarWith : return 2
          case .searchHorrorMoviesWith : return 3
          case .getPopularMovies : return 4
          }
      }
}
