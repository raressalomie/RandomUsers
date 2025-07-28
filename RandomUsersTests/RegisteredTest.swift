//
//  RegisteredTest.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import XCTest
@testable import RandomUsers

final class RegisteredTests: XCTestCase {
    func testRegisteredInitialization() {
        let reg = Registered(date: "2007-07-09T05:51:59.390Z", age: 30)
        XCTAssertEqual(reg.date, "2007-07-09T05:51:59.390Z")
        XCTAssertEqual(reg.age, 30)
    }
    
    func testRegisteredInitWithCodable() throws {
        let data = try JSONEncoder().encode(Preview.registered)
        let decoded = try JSONDecoder().decode(Registered.self, from: data)
        XCTAssertEqual(decoded, Preview.registered, "Decoded JSON does not match original Registered.")
    }
}
