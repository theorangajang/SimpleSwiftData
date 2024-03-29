//
//  SimpleSwiftDataApp.swift
//  SimpleSwiftData
//
//  Created by Alex Jang on 2/13/24.
//

import SwiftUI
import SwiftData

@main
struct SimpleSwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Card.self])
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
        }
        .modelContainer(sharedModelContainer)
    }
}
