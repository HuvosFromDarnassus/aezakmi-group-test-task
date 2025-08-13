//
//  MainTabView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab: Tab = .settings

    var body: some View {
        ZStack {
            contentView
            TabBarView(selectedTab: $selectedTab)
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch selectedTab {
        case .control:
            Text("Control")
                .foregroundStyle(.textAndIcons)
        case .settings:
            SettingsView()
        }
    }
    
}

fileprivate struct TabBarView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 31) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    TabButton(isSelected: selectedTab == tab, icon: tab.icon) {
                        selectedTab = tab
                    }
                }
            }
        }
    }
    
}

fileprivate enum Tab: CaseIterable {

    case control, settings
    
    var icon: Image {
        switch self {
        case .control:  .init(.control)
        case .settings: .init(.settings)
        }
    }

}

#Preview {
    MainTabView()
}
