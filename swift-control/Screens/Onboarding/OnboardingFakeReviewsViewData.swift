//
//  OnboardingFakeReviewsViewData.swift
//  swift-control
//
//  Created by Daniel Tvorun on 16/08/2025.
//

import Foundation

enum OnboardingFakeReviewsViewData: CaseIterable {
    
    case first
    case second
    case third
    
    var title: String {
        switch self {
        case .first:    Strings.Onboarding.Review.First.title
        case .second:   Strings.Onboarding.Review.Second.title
        case .third:    Strings.Onboarding.Review.Third.title
        }
    }
    
    var rating: Int {
        switch self {
        case .first:    4
        case .second:   5
        case .third:    3
        }
    }
    
    var author: String {
        switch self {
        case .first:    Strings.Onboarding.Review.First.dateAndName
        case .second:   Strings.Onboarding.Review.First.dateAndName
        case .third:    Strings.Onboarding.Review.First.dateAndName
        }
    }
    
    var text: String {
        switch self {
        case .first:    Strings.Onboarding.Review.First.text
        case .second:   Strings.Onboarding.Review.First.text
        case .third:    Strings.Onboarding.Review.First.text
        }
    }
    
}
