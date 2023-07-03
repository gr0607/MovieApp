//
//  RequestProtocol.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//
import Foundation

protocol RequestProtocol {
    var path: String { get }
    var params: [String: Any] { get }
}

// MARK : - Default Implementation

extension RequestProtocol {
    var host: String {
        APIConstants.host
    }
    
    var params: [String: Any] {
        ["key": APIConstants.key]
    }
    
    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        
        guard let url = components.url else { throw NetworkError.invalidURL}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        return urlRequest
    }
}
