//
//  PictureTest.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import XCTest
@testable import RandomUsers

final class PictureTests: XCTestCase {
    func testPictureInitialization() {
        let pic = Picture(
            large: "https://example.com/large.jpg",
            medium: "https://example.com/medium.jpg",
            thumbnail: "https://example.com/thumb.jpg"
        )
        XCTAssertEqual(pic.large, "https://example.com/large.jpg")
        XCTAssertEqual(pic.medium, "https://example.com/medium.jpg")
        XCTAssertEqual(pic.thumbnail, "https://example.com/thumb.jpg")
    }
    
    func testPictureInitWithCodable() throws {
        let data = try JSONEncoder().encode(Preview.picture)
        let decoded = try JSONDecoder().decode(Picture.self, from: data)
        XCTAssertEqual(decoded, Preview.picture, "Decoded JSON does not match original Pciture.")
    }
}
