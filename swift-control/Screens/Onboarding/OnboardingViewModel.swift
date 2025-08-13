//
//  OnboardingViewModel.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

@Observable
final class OnboardingViewModel: ObservableObject {
    
    // MARK: Properties
    
    var currentPageIndex: Int = 0
    var currentBackgroundImage: Image { backgroundImages[currentPageIndex] }
    var currentTitle: String { titles[currentPageIndex] }
    var currentSubtitle: String { subtitles[currentPageIndex] }
    
    private var backgroundImages: [Image] = [
        .init(.onboardingFirst),
        .init(.onboardingSecond),
        .init(.onboardingThird)
    ]
    private var titles: [String] = [
        Strings.Onboarding.Title.first,
        Strings.Onboarding.Title.second,
        Strings.Onboarding.Title.third
    ]
    private var subtitles: [String] = [
        Strings.Onboarding.Subtitle.first,
        Strings.Onboarding.Subtitle.second,
        Strings.Onboarding.Subtitle.third
    ]
    private let pageCount: Int = 2
    
    // MARK: Events
    
    func didTapActionButton() {
        if currentPageIndex < pageCount {
            currentPageIndex += 1
        }
    }
    
}
