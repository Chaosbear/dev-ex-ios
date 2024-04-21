//
//  dev_ex_iosApp.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 22/4/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct dev_ex_iosApp: App {
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
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
