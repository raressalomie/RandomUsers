//
//  Street.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import SwiftData
import Foundation

@Model class Street: Codable {
    enum CodingKeys: String, CodingKey {
        case number
        case name
    }
    
    init(number: Int, name: String) {
        self.number = number
        self.name = name
    }
    
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(Int.self, forKey: .number)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(name, forKey: .name)
    }
    
    var number: Int
    var name: String
    var fullStreet: String {
        String("\(number) \(name)")
    }
}

extension Street: Equatable {
    static func == (lhs: Street, rhs: Street) -> Bool {
        lhs.number == rhs.number && lhs.name == rhs.name
    }
}
