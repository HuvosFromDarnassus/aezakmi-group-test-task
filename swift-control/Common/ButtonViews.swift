//
//  ButtonViews.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

struct ActionButton: View {
    
    // MARK: Properties
    
    let title: String
    let action: () -> Void
    
    // MARK: Body
    
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
    
    // MARK: Properties

    let isSelected: Bool
    let icon: Image
    let action: () -> Void
    
    // MARK: Body
    
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

struct RemoteSquareButton: View {
    
    // MARK: Properties

    let label: String
    let icon: String
    let size: CGFloat
    let isAccent: Bool
    let action: () -> Void
    @State private var isPressed = false
    
    // MARK: Initilizers
    
    init(
        label: String,
        icon: String,
        size: CGFloat,
        isAccent: Bool = false,
        action: @escaping () -> Void,
        isPressed: Bool = false
    ) {
        self.label = label
        self.icon = icon
        self.size = size
        self.isAccent = isAccent
        self.action = action
        self.isPressed = isPressed
    }
    
    // MARK: Body
    
    var body: some View {
        Button(action: action) {
            ZStack {
                BackgroundGradient(
                    cornerRadius: 25,
                    colors: [
                        isAccent ? Color(hex: "#C8135C") : Color(hex: "#2C2F36"),
                        isAccent ? Color(hex: "#9F0040") : Color(hex: "#1A1C20")
                    ]
                )
                
                if label.isEmpty {
                    Image(icon)
                        .foregroundColor(.white)
                } else {
                    Text(label)
                        .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: isAccent ? 28 : 17))
                        .foregroundStyle(.textAndIcons)
                }
            }
            .frame(width: size, height: size)
            .scaleEffect(isPressed ? 0.94 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: isPressed)
            .onLongPressGesture(minimumDuration: 0.01, pressing: { pressing in
                isPressed = pressing
            }, perform: action)
            .accessibilityLabel(Text(label))
        }
        .buttonStyle(.plain)
    }

}

struct RemoteRectangleButton: View {
    
    // MARK: Properties
    
    let width: CGFloat
    let height: CGFloat
    let topIcon: String
    let middleIcon: String?
    let middleText: String?
    let bottomIcon: String
    let topAction: () -> Void
    let bottomAction: () -> Void
    @State private var isPressed = false
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            BackgroundGradient(
                cornerRadius: 25,
                colors: [
                    .init(.grayGradientLight),
                    .init(.grayGradientDark)
                ]
            )
            
            VStack {
                Button(action: topAction) {
                    Image(topIcon)
                        .foregroundColor(.white)
                }
                Spacer()
                if let middleText {
                    Text(middleText)
                        .font(Fonts.Roboto.semiBold.swiftUIFont(fixedSize: 20))
                        .foregroundStyle(.textAndIcons)
                } else if let middleIcon {
                    Image(middleIcon)
                        .foregroundColor(.white)
                }
                Spacer()
                Button(action: bottomAction) {
                    Image(bottomIcon)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 16)
        }
        .frame(width: width, height: height)
        .scaleEffect(isPressed ? 0.94 : 1.0)
        .animation(.spring(response: 0.25, dampingFraction: 0.6), value: isPressed)
        .onLongPressGesture(minimumDuration: 0.01, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
    
}

// MARK: - Preview

#Preview {
    ZStack {
        Color(.backgroundPrimary)
            .ignoresSafeArea()

        VStack(spacing: 24) {
            ActionButton(title: "Continue") {
                print("Tap")
            }
            
            HStack {
                TabButton(isSelected: true, icon: .init(.control), action: {})
                TabButton(isSelected: false, icon: .init(.settings), action: {})
            }
            
            VStack {
                HStack(spacing: 12) {
                    RemoteSquareButton(label: "", icon: "power", size: 70, action: {})
                    RemoteSquareButton(label: "MENU", icon: "", size: 70, action: {})
                    RemoteSquareButton(label: "", icon: "volume-off", size: 70, action: {})
                }
                RemoteSquareButton(label: "", icon: "chevron-up", size: 70, isAccent: true, action: {})
                HStack(spacing: 12) {
                    RemoteRectangleButton(
                        width: 70,
                        height: 232,
                        topIcon: "chevron-up",
                        middleIcon: nil,
                        middleText: "CH",
                        bottomIcon: "chevron-down",
                        topAction: {},
                        bottomAction: {}
                    )
                    RemoteRectangleButton(
                        width: 70,
                        height: 232,
                        topIcon: "plus",
                        middleIcon: "volume-on",
                        middleText: nil,
                        bottomIcon: "minus",
                        topAction: {},
                        bottomAction: {}
                    )
                }
            }
        }
    }
}
