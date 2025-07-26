//
//  Location.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import MapKit
import SwiftData
import Foundation

@Model class Location: Codable {
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case country
        case coordinates
    }
    
    init(street: Street, city: String, state: String, country: String, coordinates: Coordinates) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.coordinates = coordinates
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(country, forKey: .country)
        try container.encode(coordinates, forKey: .coordinates)
    }
    
    var street: Street
    var city: String
    var state: String
    var country: String
    var coordinates: Coordinates
    var mapLocation:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: Double(coordinates.latitude)!, longitude: Double(coordinates.latitude)!)
    }
}
