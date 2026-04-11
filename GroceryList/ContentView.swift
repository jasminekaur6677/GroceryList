//
//  ContentView.swift
//  GroceryList
//
//  Created by Jasmine Kaur on 10/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var query: [Item]
    
    func addEssentialItems() {
        modelContext.insert(Item(title: "Milk", isCompleted: true))
        modelContext.insert(Item(title: "Bread", isCompleted: false))
        modelContext.insert(Item(title: "Eggs", isCompleted: .random()))
        modelContext.insert(Item(title: "Tofu", isCompleted: .random()))
        modelContext.insert(Item(title: "Curd", isCompleted: .random()))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(query) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .foregroundStyle(item.isCompleted == false ? Color.primary : Color.accentColor)
                        .italic(item.isCompleted)
                        .strikethrough(item.isCompleted)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                item.isCompleted.toggle()
                            } label: {
                                Label("", systemImage: item.isCompleted ? "x.circle" : "checkmark.circle")
                            }
                            
                        }
                        .tint(item.isCompleted ? .accentColor : .green)
                }
            }
            .navigationTitle("Grocery List")
            .toolbar(content: {
                if query.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialItems()
                        } label: {
                            Label("Add", systemImage: "carrot")
                        }
                    }
                }
            })
            
            .padding()
            .overlay {
                if query.isEmpty {
                    ContentUnavailableView("No Item Added", systemImage: "cart.circle", description: Text("Add items to view in list"))
                }
            }
        }
    }
}

#Preview("Sample Data") {
    
    let sampleData: [Item] = [
        Item(title: "Milk", isCompleted: true),
        Item(title: "Bread", isCompleted: false),
        Item(title: "Eggs", isCompleted: .random()),
        Item(title: "Tofu", isCompleted: .random()),
        Item(title: "Curd", isCompleted: .random()),
    ]
    
    var container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
    return ContentView()
        .modelContainer(container)
}

#Preview("original") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
