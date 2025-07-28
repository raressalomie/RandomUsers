//
//  Picture.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import SwiftData
import Foundation

@Model class Picture: Codable {
    enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
    
    init(large: String, medium: String, thumbnail: String) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        large = try container.decode(String.self, forKey: .large)
        medium = try container.decode(String.self, forKey: .medium)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(large, forKey: .large)
        try container.encode(medium, forKey: .medium)
        try container.encode(thumbnail, forKey: .thumbnail)
    }
    
    var large: String
    var medium: String
    var thumbnail: String
}

extension Picture: Equatable {
    static func == (lhs: Picture, rhs: Picture) -> Bool {
        lhs.large == rhs.large &&
        lhs.medium == rhs.medium &&
        lhs.thumbnail == rhs.thumbnail
    }
}
