//
//  LocationTest.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import XCTest
@testable import RandomUsers

final class LocationTests: XCTestCase {
    func testLocationInitialization() {
        let street = Street(number: 8929, name: "Valwood Pkwy")
        let coords = Coordinates(latitude: "-69.8246", longitude: "134.8719")
        let location = Location(street: street, city: "Billings", state: "Michigan", country: "United States", coordinates: coords)
        
        XCTAssertEqual(location.street, street)
        XCTAssertEqual(location.city, "Billings")
        XCTAssertEqual(location.state, "Michigan")
        XCTAssertEqual(location.country, "United States")
        XCTAssertEqual(location.coordinates, coords)
    }
    
    func testLocationInitWithCodable() throws {
        let original = Preview.location
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Location.self, from: data)
        XCTAssertEqual(decoded, Preview.location, "The decoded JSON does not match the original Location")
    }
}
