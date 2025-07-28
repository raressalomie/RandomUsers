//
//  Name.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import SwiftData
import Foundation

@Model class Name: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case first
        case last
    }
    
    init(title: String, first: String, last: String) {
        self.title = title
        self.first = first
        self.last = last
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        first = try container.decode(String.self, forKey: .first)
        last = try container.decode(String.self, forKey: .last)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(first, forKey: .first)
        try container.encode(last, forKey: .last)
    }
    
    var title: String
    var first: String
    var last: String
    var fullName: String {
        String("\(title) \(first) \(last)")
    }
}

extension Name: Equatable {
    static func == (lhs: Name, rhs: Name) -> Bool {
        lhs.title == rhs.title &&
        lhs.first == rhs.first &&
        lhs.last == rhs.last
    }
}
