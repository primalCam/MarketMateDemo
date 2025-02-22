//
//  MarketMateApp.swift
//  MarketMate
//
//  Created by Cameryn Smith on 7/16/24.
//

import SwiftUI
import SwiftData

@main
struct MarketMateApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            homeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
