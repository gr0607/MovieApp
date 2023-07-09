//
//  Genre.swift
//  MovieApp
//
//  Created by admin on 09.07.2023.
//

import Foundation

enum Genre: CaseIterable {
    case action
    case cartoon
    case documentary
    case horror
}

extension Genre: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case "Action": self = .action
        case "Cartoon": self = .cartoon
        case "Documentary": self = .documentary
        case "Horror" : self = .horror
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .action: return "Action"
        case .cartoon: return "Cartoon"
        case .documentary: return "Documentary"
        case .horror: return "Horror"
        }
    }
}
