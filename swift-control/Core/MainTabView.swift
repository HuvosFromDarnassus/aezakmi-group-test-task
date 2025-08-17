//
//  MainTabView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

final class TabBarState: ObservableObject {

    @Published var isHidden: Bool = false

}

struct MainTabView: View {
    
    // MARK: Properties
    
    @StateObject private var tabBarState = TabBarState()
    @State private var selectedTab: Tab = .control

    // MARK: Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            contentView
                .environmentObject(tabBarState)
            
            TabBarView(selectedTab: $selectedTab)
                .transition(.move(edge: .bottom))
                .animation(.easeInOut(duration: 0.3), value: tabBarState.isHidden)
                .opacity(tabBarState.isHidden ? 0 : 1)
                .offset(y: tabBarState.isHidden ? 100 : 0)
        }
    }
    
    // MARK: Views

    @ViewBuilder
    private var contentView: some View {
        switch selectedTab {
        case .control:
            RemoteControlView()
        case .settings:
            SettingsView()
        }
    }
    
}

fileprivate struct TabBarView: View {
    
    // MARK: Properties
    
    @Binding var selectedTab: Tab
    
    // MARK: Body
    
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

// MARK: - Preview

#Preview {
    MainTabView()
}
