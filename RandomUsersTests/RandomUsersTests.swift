//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import XCTest
@testable import RandomUsers

final class RandomUsersTests: XCTestCase {
    
    func testUserInitialization() {
        //Given or Arrange
        let gender = "female"
        let name = Name(title: "Miss", first: "Jennie", last: "Nichols")
        let coordinates = Coordinates(latitude: "-69.8246", longitude: "134.8719")
        let street = Street(number: 8929, name: "Valwood Pkwy")
        let location = Location(street: street, city: "Billings", state: "Michigan", country: "United States", coordinates: coordinates)
        let email = "jennie.nichols@example.com"
        let registered = Registered(date: "2007-07-09T05:51:59.390Z", age: 30)
        let phone = "(272) 790-0888"
        let picture = Picture(large: "https://randomuser.me/api/portraits/men/75.jpg", medium: "https://randomuser.me/api/portraits/med/men/75.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg")
        
        //When or Act
        let user = User(gender: gender, name: name, location: location, email: email, registered: registered, phone: phone, picture: picture)
        
        //Then or Assert
        XCTAssertEqual(user.gender, gender)
        XCTAssertEqual(user.name, name)
        XCTAssertEqual(user.location.coordinates, coordinates)
        XCTAssertEqual(user.location.street, street)
        XCTAssertEqual(user.location, location)
        XCTAssertEqual(user.email, email)
        XCTAssertEqual(user.registered, registered)
        XCTAssertEqual(user.phone, phone)
        XCTAssertEqual(user.picture, picture)
        
    }
    
    func testUserInitWithCodable() {
        let user = Preview.user
        
        do {
            let decodedUser = try JSONDecoder().decode(User.self, from: Preview.userData)
            dump(user)
            dump(decodedUser)
            
            XCTAssertEqual(user, decodedUser, "Decoded JSON doesn't match the given User preview")
        } catch {
            XCTFail("Decoding fail: \(error.localizedDescription)")
        }
    }
}
