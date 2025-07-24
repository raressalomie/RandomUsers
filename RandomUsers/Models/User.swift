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
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}

