//
//  UserListView.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 27/7/25.
//

import SwiftData
import SwiftUI
import MapKit

struct UserListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @State private var searchText: String
    
    init(searchText: String) {
        self.searchText = searchText
        
        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            _users = Query(
                filter: #Predicate<User> { user in
                    user.name.first.contains(searchText) ||
                    user.name.last.contains(searchText) ||
                    user.email.contains(searchText)
                },sort: [SortDescriptor(\User.name.first),
                         SortDescriptor(\User.name.last),
                         SortDescriptor(\User.email)])
        }
    }
    
    var body: some View {
        List {
            ForEach(users, id: \.name.first) { user in
                NavigationLink {
                    UserView(user: user, camerPosition: .camera(MapCamera(centerCoordinate: user.location.mapLocation, distance: 30000)))
                } label: {
                    HStack {
                        AsyncImage (url: URL(string: user.picture.thumbnail)!) { image in
                            image
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(.rect(cornerRadius: 15))
                        } placeholder: {
                            Image(.defaultUser)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(.rect(cornerRadius: 15))
                        }
                        
                        VStack(alignment: .leading) {
                            Text(user.name.fullName)
                                .font(.headline)
                            
                            Text(user.email)
                            
                            Text(user.phone)
                        }
                        .padding([.leading])
                    }
                }
            }
            .onDelete { indexSet in
                deleteItems(at: indexSet)
            }
        }
        .task {
            if users.isEmpty {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "http://api.randomuser.me/?results=40") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                for user in decodedResponse.results {
                    if !users.contains(where: { $0.name.fullName == user.name.fullName }) {
                        // addUserIfNotDeleted(user: user)
                        modelContext.insert(user)
                    }
                }
                
                try? modelContext.save()
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
    private func deleteItems(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                //modelContext.insert(DeletedUser(id: users[index].id.value))
                modelContext.delete(users[index])
            }
        }
    }
}


#Preview {
    UserListView(searchText: "")
        .modelContainer(for: User.self, inMemory: true)
}
