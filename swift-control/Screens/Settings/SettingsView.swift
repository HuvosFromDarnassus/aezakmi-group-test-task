//
//  SettingsView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Properties
    
    @State private var selection: SettingsItem? = nil
    @State private var showShareSheet = false
    
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
                    
                    List(SettingsItem.allCases, id: \.self) { item in
                        SettingsRow(item: item)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))
                            .onTapGesture {
                                switch item {
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
                .navigationDestination(isPresented: Binding(
                    get: { selection != nil },
                    set: { if !$0 { selection = nil } }
                )) {
                    if let item = selection {
                        item.destination
                    }
                }
            }
        }
    }

}

// MARK: - Preview

#Preview {
    SettingsView()
}
