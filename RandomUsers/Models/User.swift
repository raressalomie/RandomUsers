//
//  User.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import MapKit
import SwiftData
import Foundation

@Model class User: Codable {
    enum CodingKeys: String, CodingKey {
        case gender
        case name
        case location
        case email
        case registered
        case phone
        case picture
    }
    
    init(gender: String, name: Name, location: Location, email: String, registered: Registered, phone: String, picture: Picture) {
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.registered = registered
        self.phone = phone
        self.picture = picture
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gender = try container.decode(String.self, forKey: .gender)
        name = try container.decode(Name.self, forKey: .name)
        location = try container.decode(Location.self, forKey: .location)
        email = try container.decode(String.self, forKey: .email)
        registered = try container.decode(Registered.self, forKey: .registered)
        phone = try container.decode(String.self, forKey: .phone)
        picture = try container.decode(Picture.self, forKey: .picture)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gender, forKey: .gender)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(email, forKey: .email)
        try container.encode(registered, forKey: .registered)
        try container.encode(phone, forKey: .phone)
        try container.encode(picture, forKey: .picture)
    }
    
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var registered: Registered
    var phone: String
    var picture: Picture
}

