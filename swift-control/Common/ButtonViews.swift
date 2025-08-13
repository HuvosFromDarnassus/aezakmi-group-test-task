//
//  ButtonViews.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.textAndIcons)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.accentPrimary)
                .cornerRadius(15)
        }
    }

}

struct TabButton: View {

    let isSelected: Bool
    let icon: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(isSelected ? .accentSecondary : .clear)
                    .frame(
                        width: isSelected ? 80 : 50,
                        height: isSelected ? 80 : 50
                    )
                
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: isSelected ? 36 : 24,
                        height: isSelected ? 36 : 24
                    )
            }
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }

}

#Preview {
    VStack {
        ActionButton(title: "Continue") {
            print("Tap")
        }
        
        HStack {
            TabButton(isSelected: true, icon: .init(.control), action: {})
            TabButton(isSelected: false, icon: .init(.settings), action: {})
        }
    }
}
