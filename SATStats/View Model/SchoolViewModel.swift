//
//  SchoolViewModel.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import Foundation

class SchoolViewModel {
    
    var schools = [School]()
    
    func fetchSchools(completion: @escaping (Error?) -> ()) {
        SchoolManager.shared.fetchSchools { [weak self] result in
            switch result {
            case .success(let schools):
                self?.schools = schools
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func fetchSchoolTestScores(for dbn: String, completion: @escaping (Result<[Score], Error>) -> ()) {
        SchoolManager.shared.fetchSchoolTestScores(dbn) { result in
            switch result {
            case .success(let scores):
                completion(.success(scores))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
