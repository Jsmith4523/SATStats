//
//  School.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import Foundation

struct School: Codable {
    
    let dbn: String
    let name: String
    let boro: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
        case boro
        case overview = "overview_paragraph"
    }
}
