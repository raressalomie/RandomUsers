//
//  NameTest.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import XCTest
@testable import RandomUsers

final class NameTests: XCTestCase {
    func testNameInitialization() {
        let name = Name(title: "Ms", first: "Ada", last: "Lovelace")
        XCTAssertEqual(name.title, "Ms")
        XCTAssertEqual(name.first, "Ada")
        XCTAssertEqual(name.last, "Lovelace")
    }
    
    func testNameInitWithCodable() throws {
        let original = Preview.name
        let data = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Name.self, from: data)
        XCTAssertEqual(decoded, original, "Decoded JSON does not match original Name.")
    }
}
