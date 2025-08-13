//
//  RowViews.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct SettingsRow: View {

    let item: SettingsItem
    
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
        .contentShape(Rectangle())
        .listRowBackground(Color.clear)
    }

}

#Preview {
    List {
        SettingsRow(item: .instruction)
    }
}
