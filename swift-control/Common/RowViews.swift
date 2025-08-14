//
//  RowViews.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct SettingsRow: View {
    
    // MARK: Properties

    let item: SettingsItem
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundSecondary)
            HStack {
                item.icon
                Text(item.title)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                    .foregroundStyle(.textAndIcons)
                Spacer()
                Image(.chevronRight)
                    .foregroundStyle(.textAndIcons)
                    .opacity(0.15)
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 56)
        .cornerRadius(15)
        .listRowBackground(Color.clear)
    }

}

struct ConnectionItemRow: View {
    
    // MARK: Properties
    
    // TODO: Use device and connection status models to configure row
    let name: String
    let backgroundColor: Color
    let statusText: String
    let statusTextColor: Color
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(backgroundColor)
            HStack(spacing: 10) {
                Image(.tvOpaque)
                Text(name)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                    .foregroundStyle(.textAndIcons)
                
                Spacer()
                
                Text(statusText)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                    .foregroundStyle(statusTextColor)
            }
            .padding(16)
        }
        .frame(height: 56)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1)
        )
        .listRowBackground(Color.clear)
    }
    
}

// MARK: - Preview

#Preview {
    List {
        SettingsRow(item: .instruction)
        ConnectionItemRow(
            name: "Smart TV name",
            backgroundColor: .backgroundSecondary,
            statusText: "Not connected",
            statusTextColor: .textAndIcons.opacity(0.5)
        )
        ConnectionItemRow(
            name: "Smart TV name",
            backgroundColor: .accentPrimary,
            statusText: "Connected",
            statusTextColor: .textAndIcons
        )
        ConnectionItemRow(
            name: "Smart TV name",
            backgroundColor: .backgroundSecondary,
            statusText: "Disconnected",
            statusTextColor: .accentPrimary
        )
    }
}
