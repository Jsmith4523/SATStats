//
//  URLSession.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import Foundation

extension URLSession {
    
    enum URLSessionError: Error {
        case parseError
        case dataError
        case error(String)
    }
    
    func data<T: Decodable>(_ url: URL, for type: [T].Type, completion: @escaping (Result<[T], URLSessionError>) -> ()) {
                
        self.dataTask(with: url) { data, response, err in
            guard let data, let response = response as? HTTPURLResponse, response.statusCode == 200, err == nil else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(type, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.parseError))
            }
        }
        .resume()
    }
}
