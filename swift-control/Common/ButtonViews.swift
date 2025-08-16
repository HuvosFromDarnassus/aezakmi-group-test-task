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

struct SquareButton: View {
    
    // MARK: Properties

    let label: String
    let icon: String
    let size: CGFloat
    let isAccent: Bool
    let isSticky: Bool
    let action: () -> Void
    
    @State private var isPressed = false
    @State private var isToggled = false
    
    // MARK: Initilizers
    
    init(
        label: String,
        icon: String,
        size: CGFloat,
        isAccent: Bool = false,
        isSticky: Bool = false,
        action: @escaping () -> Void,
        isPressed: Bool = false
    ) {
        self.label = label
        self.icon = icon
        self.size = size
        self.isAccent = isAccent
        self.isSticky = isSticky
        self.action = action
        self.isPressed = isPressed
    }
    
    // MARK: Body
    
    var body: some View {
        Button(action: {
            action()
            
            if isSticky {
                isToggled.toggle()
            }
        }) {
            ZStack {
                BackgroundGradient(
                    shape: .rect,
                    cornerRadius: 25,
                    colors: [
                        isAccent || isToggled ? Color(hex: "#C8135C") : Color(hex: "#2C2F36"),
                        isAccent || isToggled ? Color(hex: "#9F0040") : Color(hex: "#1A1C20")
                    ]
                )
                .transition(.scale.combined(with: .opacity))
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isToggled)
                
                if label.isEmpty {
                    Image(icon)
                } else {
                    Text(label)
                        .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: isAccent || isToggled ? 28 : 17))
                        .foregroundStyle(.textAndIcons)
                }
            }
            .frame(width: size, height: size)
            .scaleEffect(isPressed ? 0.94 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: isPressed)
            .onLongPressGesture(minimumDuration: 0.01, pressing: { pressing in
                isPressed = pressing
            }, perform: {
                action()
                
                if isSticky {
                    isToggled.toggle()
                }
            })
            .accessibilityLabel(Text(label))
        }
        .buttonStyle(.plain)
    }

}

struct RectangleButton: View {
    
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
                shape: .rect,
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

struct SemicircleButton: View {
    
    // MARK: Properties
    
    enum Orientation {
        case top
        case bottom
        case left
        case right
    }
    
    let label: String
    let icon: String
    let radius: CGFloat
    let isAccent: Bool
    let orientation: Orientation
    let action: () -> Void
    
    @State private var isPressed = false
    
    // MARK: Body
    
    var body: some View {
        Button(action: action) {
            ZStack {
                circleSectorBackground
                VStack {
                    if orientation == .bottom {
                        Spacer()
                    }
                    HStack {
                        if orientation == .right {
                            Spacer()
                        }
                        
                        iconOrText
                        
                        if orientation == .left {
                            Spacer()
                        }
                    }
                    if orientation == .top {
                        Spacer()
                    }
                }
            }
            .frame(width: radius, height: radius)
            .scaleEffect(isPressed ? 0.94 : 1.0)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: isPressed)
            .onLongPressGesture(minimumDuration: 0.01, pressing: { pressing in
                isPressed = pressing
            }, perform: action)
        }
        .buttonStyle(.plain)
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var circleSectorBackground: some View {
        SectorShape(orientation: orientation)
            .fill(
                LinearGradient(
                    colors: [
                        isAccent ? Color(hex: "#C8135C") : Color(hex: "#2C2F36"),
                        isAccent ? Color(hex: "#9F0040") : Color(hex: "#1A1C20")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 2)
    }
    
    @ViewBuilder
    private var iconOrText: some View {
        if label.isEmpty {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: radius * 0.12, height: radius * 0.2)
                .padding(orientation == .right || orientation == .left ? 10 : 0)
        } else {
            Text(label)
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: isAccent ? 28 : 17))
                .foregroundStyle(.white)
        }
    }

}

struct CircleButtom: View {
    
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
                    shape: .circle,
                    cornerRadius: 25,
                    colors: [
                        isAccent ? Color(hex: "#C8135C") : Color(hex: "#2C2F36"),
                        isAccent ? Color(hex: "#9F0040") : Color(hex: "#1A1C20")
                    ]
                )
                
                if label.isEmpty {
                    Image(icon)
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

fileprivate struct SectorShape: Shape {
    
    // MARK: Properties

    let orientation: SemicircleButton.Orientation
    var gapAngle: Double = 2
    var gapRadius: CGFloat = 1
    
    // MARK: Shape
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2 - gapRadius
        let innerRadius = outerRadius * 0.6 + gapRadius
        
        let angles: (start: Angle, end: Angle) = {
            switch orientation {
            case .top:
                (Angle(degrees: -135 + gapAngle), Angle(degrees: -45 - gapAngle))
            case .right:
                (Angle(degrees: -45 + gapAngle), Angle(degrees: 45 - gapAngle))
            case .bottom:
                (Angle(degrees: 45 + gapAngle), Angle(degrees: 135 - gapAngle))
            case .left:
                (Angle(degrees: 135 + gapAngle), Angle(degrees: 225 - gapAngle))
            }
        }()
        
        var path = Path()
        path.move(to: center)
        path.addArc(center: center, radius: outerRadius,
                    startAngle: angles.start,
                    endAngle: angles.end,
                    clockwise: false)
        path.closeSubpath()
        
        var innerPath = Path()
        innerPath.move(to: center)
        innerPath.addArc(center: center, radius: innerRadius,
                         startAngle: angles.start,
                         endAngle: angles.end,
                         clockwise: false)
        innerPath.closeSubpath()
        
        return path.subtracting(innerPath)
    }

}

// MARK: - Preview

#Preview {
    ZStack {
        Color(.backgroundPrimary)
            .ignoresSafeArea()

        VStack(spacing: 24) {
            VStack {
                HStack(spacing: 12) {
                    SquareButton(label: "", icon: "power", size: 70, isSticky: true) {}
                    SquareButton(label: "MENU", icon: "", size: 70) {}
                    SquareButton(label: "", icon: "volume-off", size: 70) {}
                    SquareButton(label: "", icon: "chevron-up", size: 70, isAccent: true) {}
                }
                HStack(spacing: 12) {
                    RectangleButton(
                        width: 70,
                        height: 232,
                        topIcon: "chevron-up",
                        middleIcon: nil,
                        middleText: "CH",
                        bottomIcon: "chevron-down",
                        topAction: {},
                        bottomAction: {}
                    )
                    RectangleButton(
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
                ZStack {
                    SemicircleButton(label: "", icon: "chevron-up", radius: 250, isAccent: true, orientation: .top) {}
                    SemicircleButton(label: "", icon: "chevron-down", radius: 250, isAccent: true, orientation: .bottom) {}
                    SemicircleButton(label: "", icon: "chevron-left", radius: 250, isAccent: true, orientation: .left) {}
                    SemicircleButton(label: "", icon: "chevron-right", radius: 250, isAccent: true, orientation: .right) {}
                    CircleButtom(label: "OK", icon: "", size: 120, isAccent: true) {}
                }
            }
            ActionButton(title: "Continue") {
                print("Tap")
            }
            HStack {
                TabButton(isSelected: true, icon: .init(.control)) {}
                TabButton(isSelected: false, icon: .init(.settings)) {}
            }
        }
    }
}
