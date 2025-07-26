//
//  Response.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import SwiftData
import Foundation

@Model class Response: Codable {
    enum CodingKeys: String, CodingKey {
        case results
        case info
    }
    
    init(results: [User], info: Info) {
        self.results = results
        self.info = info
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([User].self, forKey: .results)
        self.info = try container.decode(Info.self, forKey: .info)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(results, forKey: .results)
        try container.encode(info, forKey: .info)
    }
    
    var results: [User]
    var info: Info
}
