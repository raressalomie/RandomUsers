//
//  UserSwiftDataTests.swift
//  RandomUsersTests
//
//  Created by Tiberiu Rares Salomie on 28/7/25.
//

import SwiftData
import XCTest
@testable import RandomUsers

@MainActor
final class UserSwiftDataTests: XCTestCase {
    
    private var container: ModelContainer!
    private var context: ModelContext!

    override func setUpWithError() throws {
        let schema = Schema([User.self])
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: schema, configurations: config)
        context = container.mainContext
    }
    
    private func fetchAllUsers() throws -> [User] {
        try context.fetch(FetchDescriptor<User>())
    }
    
    private func fetchUsers(withEmail email: String) throws -> [User] {
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate { $0.email == email }
        )
        return try context.fetch(descriptor)
    }
    
    func testInsertUser_PersistsAndFetchesByEmail() throws {
        //Given
        let user = Preview.user
        
        // When
        context.insert(user)
        try context.save()
        
        // Then
        let fetched = try fetchUsers(withEmail: user.email)
        XCTAssertEqual(fetched.count, 1, "Exactly one user with this email should exist.")
        XCTAssertEqual(fetched.first?.email, user.email)
        XCTAssertEqual(fetched.first?.name, user.name)
        XCTAssertEqual(fetched.first?.location, user.location)
        XCTAssertEqual(fetched.first?.picture, user.picture)
        XCTAssertEqual(fetched.first?.gender, user.gender)
        XCTAssertEqual(fetched.first?.phone, user.phone)
    }
    
    func testDeleteSingleUser_RemovesItFromStore() throws {
        let user1 = User(gender: Preview.gender, name: Preview.name, location: Preview.location, email: "user1@email.com", registered: Preview.registered, phone: Preview.phone, picture: Preview.picture)
        let user2 = User(gender: Preview.gender, name: Preview.name, location: Preview.location, email: "user2@email.com", registered: Preview.registered, phone: Preview.phone, picture: Preview.picture)
        context.insert(user1)
        context.insert(user2)
        try context.save()
        XCTAssertEqual(try fetchAllUsers().count, 2)
        
        // When whe delete one user
        context.delete(user2)
        try context.save()
        
        // Then
        XCTAssertEqual(try fetchUsers(withEmail: user2.email).count, 0, "Deleted user should not be fetchable.")
        XCTAssertEqual(try fetchUsers(withEmail: user1.email).count, 1, "Non-deleted user should still exist.")
    }

}
