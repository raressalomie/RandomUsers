//
//  Registered.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import SwiftData
import Foundation

@Model class Registered: Codable {
    enum CodingKeys: String, CodingKey {
        case date
        case age
    }
    
    init(date: String, age: Int) {
        self.date = date
        self.age = age
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        age = try container.decode(Int.self, forKey: .age)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(age, forKey: .age)
    }
    
    var date: String
    var age: Int
}
