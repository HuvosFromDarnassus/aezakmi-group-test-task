//
//  PaywallFeaturesViewData.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

enum PaywallFeaturesViewData: CaseIterable {
    
    case video
    case mute
    
    var icon: Image {
        switch self {
        case .video:    .init(.paywallFeatureOne)
        case .mute:     .init(.paywallFeatureTwo)
        }
    }
    
    var text: String {
        switch self {
        case .video:    Strings.Paywall.Feature.first
        case .mute:     Strings.Paywall.Feature.second
        }
    }
    
}
