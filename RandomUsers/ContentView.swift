//
//  ContentView.swift
//  RandomUsers
//
//  Created by Tiberiu Rares Salomie on 24/7/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users, id: \.name.first) { user in
                NavigationLink {
                    Text(user.name.first)
                } label: {
                    Text(user.name.first)
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await loadData()
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
                self.users = decodedResponse.results
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

   /* private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(users[index])
            }
        }
    }*/
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
