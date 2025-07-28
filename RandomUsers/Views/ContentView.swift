//
//  ContentView.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var users: [User]
    @Query private var deletedUsers: [DeletedUser]
    @State private var searchText: String = ""
    @State private var showAlert = false
    @State private var messageAlert = ""
    
    var body: some View {
        NavigationStack {
            UserListView(searchText: searchText)
                .navigationTitle("Users")
                .toolbar {
                    Button("Add Sample", systemImage: "plus") {
                        Task {
                            await loadData()
                        }
                    }
                }
                .searchable(text: $searchText)
                .alert("Atention!", isPresented: $showAlert) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text(messageAlert)
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
                if !users.isEmpty {
                    showAlert = true
                    messageAlert = "More user have been added at the end of the list."
                }
                
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
    
    /*private func addUserIfNotDeleted(user: User) {
        if !deletedUsers.contains(where: { $0.id == user.id.value }) {
            modelContext.insert(user)
        } else {
            print("User with id: \(user.id.value) was deleted")
        }
    }*/
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
