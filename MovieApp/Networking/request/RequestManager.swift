//
//  RequestManager.swift
//  MovieApp
//
//  Created by admin on 03.07.2023.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T:Decodable>(_ request: RequestProtocol, completionHangler: @escaping (T?) -> ())
}

class RequestManager: RequestManagerProtocol {
    let networkManager: NetworkManagerProtocol
    let parser: DataParserProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(), parser: DataParserProtocol = DataParser()) {
        self.networkManager = networkManager
        self.parser = parser
    }
    
    func perform<T>(_ request: RequestProtocol, completionHangler: @escaping (T?) -> ()) where T : Decodable {
        networkManager.perform(request) { response in
            switch response {
            case .success(let data):
                do {
                    let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                     completionHangler(decodedData)
                } catch let error{
                    print("Cannot conver data \(error.localizedDescription)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
