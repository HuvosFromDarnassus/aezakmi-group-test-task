//
//  App.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

@main
struct MainApp: App {
    
    // MARK: Properties
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    // MARK: Body

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainTabView()
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }

}
