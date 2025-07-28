//
//  CoordinatesTest.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import XCTest
@testable import RandomUsers

final class CoordinatesTests: XCTestCase {
    func testCoordinatesInitialization() {
        let coords = Coordinates(latitude: "1.2345", longitude: "-9.8765")
        XCTAssertEqual(coords.latitude, "1.2345")
        XCTAssertEqual(coords.longitude, "-9.8765")
    }
    
    func testCoordinatesInitWithCodable() throws {
        let original = Preview.coordinates
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Coordinates.self, from: data)
        XCTAssertEqual(decoded, original)
    }
}
