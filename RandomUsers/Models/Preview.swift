//
//  Preview.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 25/7/25.
//

import Foundation

struct Preview {
    let user = User(gender: "male", name: Name(title: "Rares", first: "Salomie", last: "Tiberiu"), location: Location(street: Street(number: 6, name: "Avenida Catalunya"), city: "Rosselló", state: "Catalonia", country: "Spain", coordinates: Coordinates(latitude: "-69.8246", longitude: "134.8719")), email: "raressalomie@gmail.com", registered: Registered(date: "2007-07-09T05:51:59.390Z", age: 25), phone: "642419621", picture: Picture(large: "https://randomuser.me/api/portraits/men/75.jpg", medium: "https://randomuser.me/api/portraits/med/men/75.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/75.jpg"))
}
