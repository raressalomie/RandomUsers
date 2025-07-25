//
//  User.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import SwiftData
import Foundation

struct Response: Codable {
    let results: [User]
    let info: Info
}

struct Info: Codable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct User: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let registered: Registered
    let phone: String
    let picture: Picture
    
    struct Location: Codable {
        let street: Street
        let city: String
        let state: String
        let country: String
        
        struct Street: Codable {
            let number: Int
            let name: String
        }
    }
    
    struct Registered: Codable {
        let date: String
        let age: Int
    }
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
        var fullName: String {
            String("\(title) \(first) \(last)")
        }
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}

struct Preview {
    let user = User(gender: "male", name: User.Name(title: "Rares", first: "Salomie", last: "Tiberiu"), location: User.Location(street: User.Location.Street(number: 6, name: "Avenida Catalunya"), city: "Rosselló", state: "Catalonia", country: "Spain"), email: "raressalomie@gmail.com", registered: User.Registered(date: "2007-07-09T05:51:59.390Z", age: 25), phone: "642419621", picture: User.Picture(large: "https://randomuser.me/api/portraits/men/75.jpg", medium: "https://randomuser.me/api/portraits/med/men/75.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg"))
}

