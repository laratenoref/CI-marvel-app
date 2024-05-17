//
//  MarvelApp.swift
//  Marvel
//
//  Created by Clara Muniz on 10/10/23.
//

import SwiftUI
import SwiftData

@main

struct MarvelApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            CharacterFavorite.self,
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
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}
