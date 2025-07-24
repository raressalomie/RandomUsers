//
//  Item.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
