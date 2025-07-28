//
//  Coordinates.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import SwiftData
import Foundation

@Model class Coordinates: Codable {
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(String.self, forKey: .latitude)
        longitude = try container.decode(String.self, forKey: .longitude)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
    var latitude: String
    var longitude: String
}

extension Coordinates: Equatable {
    static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
        lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude
    }
}
