//
//  School.swift
//  SATStats
//
//  Created by Jaylen Smith on 10/26/23.
//

import Foundation
import CoreLocation

struct School: Codable, Comparable {
    
    let dbn: String
    let name: String
    let boro: String
    let overview: String
    let latitude: String?
    let longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
        case boro
        case overview = "overview_paragraph"
        case latitude
        case longitude
    }
    
    static func < (lhs: School, rhs: School) -> Bool {
        lhs.name < rhs.name
    }
    
    static func > (lhs: School, rhs: School) -> Bool {
        lhs.name > rhs.name
    }
}

extension School {
    
    var coordinate: CLLocationCoordinate2D? {
        guard let latitude = latitude, let longitude = longitude else { return nil}
        return CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
    }
}
