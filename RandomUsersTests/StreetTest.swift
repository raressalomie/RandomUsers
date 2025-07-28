//
//  StreetTest.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import XCTest
@testable import RandomUsers

final class StreetTests: XCTestCase {
    func testStreetInitialization() {
        let street = Street(number: 123, name: "Main St")
        XCTAssertEqual(street.number, 123)
        XCTAssertEqual(street.name, "Main St")
    }
    
    func testStreetInitWithCodable() throws {
        let original = Preview.street
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Street.self, from: data)
        XCTAssertEqual(decoded, original, "Decoded JSON does not match original Street.")
    }
}
