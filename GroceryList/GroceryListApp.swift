//
//  GroceryListApp.swift
//  GroceryList
//
//  Created by Jasmine Kaur on 10/04/26.
//

import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
