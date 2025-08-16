//
//  SettingsView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Properties
    
    @EnvironmentObject private var tabBarState: TabBarState
    @State private var selection: SettingsItem? = nil
    @State private var showShareSheet = false
    @State private var showInstructionView = false
    
    // MARK: Body

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundPrimary)
                    .ignoresSafeArea()
                
                VStack {
                    Text(Strings.Settings.title)
                        .font(Fonts.Roboto.semiBold.swiftUIFont(fixedSize: 20))
                        .foregroundStyle(.textAndIcons)
                    
                    settingsItems
                }
                .navigationDestination(isPresented: Binding(
                    get: { selection != nil },
                    set: { if !$0 { selection = nil } }
                )) {
                    if let item = selection {
                        item.destination
                            .onAppear { tabBarState.isHidden = true }
                            .onDisappear { tabBarState.isHidden = false }
                    }
                }
                .sheet(isPresented: $showInstructionView) {
                    showInstructionView = false
                } content: {
                    InstructionView { showInstructionView = false }
                        .presentationDetents([.fraction(0.999)])
                        .presentationDragIndicator(.visible)
                        .presentationBackground(.backgroundSecondary)
                        .presentationCornerRadius(20)
                        .presentationContentInteraction(.scrolls)
                        .presentationCompactAdaptation(.none)
                }
            }
        }
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var settingsItems: some View {
        List(SettingsItem.allCases, id: \.self) { item in
            SettingsRow(item: item)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                .onTapGesture {
                    switch item {
                    case .instruction:
                        showInstructionView = true
                    case .share:
                        showShareSheet = true
                    default:
                        selection = item
                    }
                }
        }
        .listStyle(.plain)
        .navigationDestination(for: SettingsItem.self) { item in
            item.destination
        }
        .popover(isPresented: $showShareSheet, arrowEdge: .bottom) {
            ActivityView(activityItems: [URL(string: "https://www.google.com")!])
        }
    }

}

// MARK: - Preview

#Preview {
    SettingsView()
}
