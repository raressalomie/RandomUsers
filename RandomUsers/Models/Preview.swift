//
//  Preview.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import Foundation

struct Preview {
    static let gender = "female"
        static let name = Name(title: "Miss", first: "Jennie", last: "Nichols")
        
        static let coordinates = Coordinates(latitude: "-69.8246", longitude: "134.8719")
        static let street = Street(number: 8929, name: "Valwood Pkwy")
        static let location = Location(
            street: street,
            city: "Billings",
            state: "Michigan",
            country: "United States",
            coordinates: coordinates
        )
        
        static let email = "jennie.nichols@example.com"
        static let registered = Registered(date: "2007-07-09T05:51:59.390Z", age: 30)
        static let phone = "(272) 790-0888"
        static let picture = Picture(
            large: "https://randomuser.me/api/portraits/men/75.jpg",
            medium: "https://randomuser.me/api/portraits/med/men/75.jpg",
            thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg"
        )
        
        static let user = User(
            gender: gender,
            name: name,
            location: location,
            email: email,
            registered: registered,
            phone: phone,
            picture: picture
        )
        
    
    static let userData = Data(#"""
    {
      "gender": "female",
      "name": {
        "title": "Miss",
        "first": "Jennie",
        "last": "Nichols"
      },
      "location": {
        "street": {
          "number": 8929,
          "name": "Valwood Pkwy"
        },
        "city": "Billings",
        "state": "Michigan",
        "country": "United States",
        "coordinates": {
          "latitude": "-69.8246",
          "longitude": "134.8719"
        }
      },
      "email": "jennie.nichols@example.com",
      "registered": {
        "date": "2007-07-09T05:51:59.390Z",
        "age": 30
      },
      "phone": "(272) 790-0888",
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/75.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
      }
    }
    """#.utf8)
    
}
