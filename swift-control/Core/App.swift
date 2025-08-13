//
//  App.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

@main
struct MainApp: App {
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                Text("Onboarding completed")
            } else {
                OnboardingView(hasSeenOnboarding: $hasSeenOnboarding)
            }
        }
    }

}
