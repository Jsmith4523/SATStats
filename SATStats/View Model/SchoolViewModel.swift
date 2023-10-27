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
                print(schools)
                self?.schools = schools
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
