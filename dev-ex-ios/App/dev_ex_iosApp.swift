//
//  dev_ex_iosApp.swift
//  dev-ex-ios
//
//  Created by Sukrit Chatmeeboon on 22/4/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct DevExIosApp: App {
    // MARK: - Property
    // appDelegate adapter
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    // theme
    @StateObject var theme = ThemeState(
        font: DefaultFontTheme(),
        color: DefaultColorTheme()
    )

    // router
    @StateObject var mainRouter: Router = Router.main

    // other
    @State private var isLaunching = true

    // MARK: - UI Body
    var body: some Scene {
        WindowGroup {
            if isLaunching {
                LaunchScreenView()
                    .transition(.opacity.animation(.default))
                    .onViewDidLoad {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            isLaunching = false
                        }
                    }
            } else {
                RouterView(router: mainRouter) {
                    RootView.view()
                }
                .transition(.opacity.animation(.default))
                .environmentObject(theme)
                .environmentObject(mainRouter)
            }
        }
    }
}

// MARK: - App Delegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        configure()

        return true
    }

    func configure() {
        NWMonitor.shared.startMonitoring()
    }
}
