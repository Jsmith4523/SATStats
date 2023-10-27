//
//  Score.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import Foundation

struct Score: Decodable {
    
    let dbn: String
    let schoolName: String
    let numTestTakers: String
    let satReadingScore: String
    let satMathScore: String
    let satWritingScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numTestTakers = "num_of_sat_test_takers"
        case satReadingScore = "sat_critical_reading_avg_score"
        case satMathScore = "sat_math_avg_score"
        case satWritingScore = "sat_writing_avg_score"
    }
}
