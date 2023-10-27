//
//  SchoolNetworkManager.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import Foundation

final class SchoolManager {
    
    ///Shared instance
    static let shared = SchoolManager()
    
    private init() {}
    
    enum SchoolNetworkError: Error {
        case urlError
    }
    
    ///Fetch NYC Schools
    func fetchSchools(completion: @escaping (Result<[School], Error>) -> ()) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            completion(.failure(SchoolNetworkError.urlError))
            return
        }
        
        URLSession.shared.data(url, for: [School].self) { result in
            switch result {
            case .success(let schools):
                completion(.success(schools))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


