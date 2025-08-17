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
                Label(item.title, image: item.icon)
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
    
    let name: String
    let status: ConnectionStatus
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(status.deviceCellBackgroundColor)
            HStack(spacing: 10) {                
                Label(name, image: .tvOpaque)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                    .foregroundStyle(.textAndIcons)
                
                Spacer()
                
                Text(status.deviceCellText)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 12))
                    .foregroundStyle(status.deviceCellTextColor)
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

struct InstructionItemRow: View {
    
    // MARK: Properties
    
    let instruction: InstructionViewData
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundSecondary)
            
            VStack(spacing: 8) {
                instruction.illustration
                    .resizable()
                    .scaledToFill()
                    .frame(width: 311, height: 147)
                    .cornerRadius(15)
                
                Text(instruction.text)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 16))
                    .foregroundStyle(.textAndIcons)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .padding(16)
        }
        .frame(height: 223)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
        )
        .listRowBackground(Color.clear)
    }
    
}

// MARK: - Preview

#Preview {
    List {
        SettingsRow(item: .instruction)
        ConnectionItemRow(name: "Smart TV", status: .empty)
        ConnectionItemRow(name: "Samsung OLED", status: .connection)
        ConnectionItemRow(name: "Huawei", status: .disconnected)
        ConnectionItemRow(name: "Philips", status: .error)
        InstructionItemRow(instruction: .connect)
        InstructionItemRow(instruction: .allow)
    }
}
