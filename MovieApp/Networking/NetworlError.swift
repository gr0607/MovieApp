//
//  NetworlError.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidServerResponse
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "Invalid response from server"
        case .invalidURL:
            return "Invalid URL"
        }
    }
}
