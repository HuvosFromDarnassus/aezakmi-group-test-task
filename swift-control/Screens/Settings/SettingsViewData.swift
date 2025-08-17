//
//  SettingsViewData.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

enum SettingsItem: CaseIterable {

    case instruction, privacy, terms, share, support
    
    var title: String {
        switch self {
        case .instruction:
            Strings.Settings.instruction
        case .privacy:
            Strings.Settings.privacy
        case .terms:
            Strings.Settings.terms
        case .share:
            Strings.Settings.share
        case .support:
            Strings.Settings.support
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .instruction:  .questionMarkLight
        case .privacy:      .shield
        case .terms:        .info
        case .share:        .share
        case .support:      .headphones
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .privacy:
            SafariView(url: URL(string: "https://www.google.com")!)
        case .terms:
            SafariView(url: URL(string: "https://www.google.com")!)
        case .support:
            SafariView(url: URL(string: "https://www.google.com")!)
        default:
            EmptyView()
        }
    }
    
}
