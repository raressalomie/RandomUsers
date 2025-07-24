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
        List(users, id: \.name.first) { user in
            Text(user.name.first)
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
            
            if let decodedResult = try? JSONDecoder().decode(Result.self, from: data) {
                users = decodedResult.results
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
