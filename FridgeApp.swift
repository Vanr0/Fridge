//
//  FridgeApp.swift
//  Fridge
//
//  Created by Ivan on 13.08.2025.
//

import SwiftData
import SwiftUI

@main
struct FridgeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Product.self
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
            
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
