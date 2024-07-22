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
    // MARK: - Property
    // appDelegate adapter
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // theme
    @StateObject var theme = ThemeState(
        font: defaultFontTheme(),
        color: defaultColorTheme()
    )

    // router
    @StateObject var router: Router = Router.shared

    // swift data
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

    // other
    @State private var isLaunching = true


    // MARK: - UI Body
    var body: some Scene {
        WindowGroup {
            if isLaunching {
                LaunchScreenView()
                    .transition(.opacity.animation(.default))
                    .onViewDidLoad {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLaunching = false
                        }
                    }
            } else {
                RouterView(router: router) {
                    ContentView()
                }
                .transition(.opacity.animation(.default))
                .environmentObject(theme)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

// MARK: - App Delegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
