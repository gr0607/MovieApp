//
//  RequestManager.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func perform (_ request: RequestProtocol,
                                completionHandler: @escaping (Result<Data, Error>) ->())
}

class NetworkManager: NetworkManagerProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform (_ request: RequestProtocol, completionHandler:@escaping (Result<Data, Error>) -> ()) {
        do {
            let request = try request.createURLRequest()
            urlSession.dataTask(with: request) { data, response, error in
                if let error = error {
                    completionHandler(.failure(error))
                    return
                }
                guard let data = data, let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    return
                }
                completionHandler(.success(data))
            }.resume()
        } catch NetworkError.invalidServerResponse {
            print(NetworkError.invalidServerResponse.errorDescription!)
        } catch let e {
            print(e.localizedDescription)
        }
    }
}
