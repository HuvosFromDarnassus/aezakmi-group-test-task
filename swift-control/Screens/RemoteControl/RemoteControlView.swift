//
//  RemoteControlView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct RemoteControlView: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel = RemoteControlViewModel()
    @State private var showNumpad = false
    @State private var showConnectionSheet = false
    
    private enum Constants {
        enum Sizes {
            static let isSmallScreen = UIScreen.main.nativeBounds.height <= 1334 /// iPhone SE 3 screen size
            static let statusBarHeight: CGFloat = 50
            static let sqButton: CGFloat = 70
            static let numpadButton: CGFloat = 48
            static let recButtonWidth: CGFloat = 84
            static let recButtonHegiht: CGFloat = 232
            static let dPadRedius: CGFloat = isSmallScreen ? 280 : 300
            static let dPadOkButtonSize: CGFloat = isSmallScreen ? 130 : 150
        }
    }
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundPrimary)
                .ignoresSafeArea()
            
            VStack(spacing: Constants.Sizes.isSmallScreen ? 10 : 34) {
                statusBar
                    .onTapGesture {
                        showConnectionSheet = true
                    }
                
                topButtons
                
                if showNumpad {
                    numpad
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                } else {
                    dPad
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Spacer(minLength: Constants.Sizes.isSmallScreen ? .infinity : .zero)
            }
            .animation(.easeInOut(duration: 0.2), value: showNumpad)
            
            dPadNumpadButton
        }
        .sheet(isPresented: $showConnectionSheet) {
            showConnectionSheet = false
        } content: {
            ConnectionView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationBackground(.backgroundSecondary)
                .presentationCornerRadius(20)
                .presentationContentInteraction(.scrolls)
                .presentationCompactAdaptation(.none)
        }
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var statusBar: some View {
        ZStack {
            BackgroundGradient(
                shape: .rect,
                cornerRadius: 16,
                colors: [viewModel.connectionStatus.statusBarBackgroundColor]
            )
            HStack(spacing: 11) {
                viewModel.connectionStatus.statusBarIcon
                    .foregroundColor(viewModel.connectionStatus.statusBarTextColor)
                Text(viewModel.connectionStatus.statusBarText)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                    .foregroundColor(viewModel.connectionStatus.statusBarTextColor)
            }
        }
        .frame(height: Constants.Sizes.statusBarHeight)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private var topButtons: some View {
        HStack(spacing: 12) {
            ForEach(viewModel.topButtonsGrid.indices, id: \.self) { column in
                VStack(spacing: 11) {
                    ForEach(viewModel.topButtonsGrid[column].indices, id: \.self) { row in
                        if let config = viewModel.topButtonsGrid[column][row] {
                            if config.isRectangular {
                                defineRectangularButton(by: config)
                            } else {
                                SquareButton(
                                    label: config.label,
                                    icon: config.icon,
                                    size: Constants.Sizes.sqButton
                                ) {
                                    viewModel.didTapButton(config.type)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func defineRectangularButton(by config: RemoteButtonConfig) -> some View {
        switch config.type {
        case .channel:
            RectangleButton(
                width: Constants.Sizes.recButtonWidth,
                height: Constants.Sizes.recButtonHegiht,
                topIcon: "chevron-up",
                middleIcon: nil,
                middleText: "CH",
                bottomIcon: "chevron-down",
                topAction: {
                    viewModel.didTapButton(.nextChannel)
                },
                bottomAction: {
                    viewModel.didTapButton(.previousChannel)
                }
            )
        case .volume:
            RectangleButton(
                width: Constants.Sizes.recButtonWidth,
                height: Constants.Sizes.recButtonHegiht,
                topIcon: "plus",
                middleIcon: "volume-on",
                middleText: nil,
                bottomIcon: "minus",
                topAction: {
                    viewModel.didTapButton(.volumeUp)
                },
                bottomAction: {
                    viewModel.didTapButton(.volumeDown)
                }
            )
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var dPad: some View {
        ZStack {
            SemicircleButton(label: "", icon: "chevron-up", radius: Constants.Sizes.dPadRedius, isAccent: true, orientation: .top) {
                viewModel.didTapButton(.up)
            }
            SemicircleButton(label: "", icon: "chevron-right", radius: Constants.Sizes.dPadRedius, isAccent: true, orientation: .right) {
                viewModel.didTapButton(.right)
            }
            CircleButtom(label: "OK", icon: "", size: Constants.Sizes.dPadOkButtonSize, isAccent: true) {
                viewModel.didTapButton(.ok)
            }
            SemicircleButton(label: "", icon: "chevron-down", radius: Constants.Sizes.dPadRedius, isAccent: true, orientation: .bottom) {
                viewModel.didTapButton(.down)
            }
            SemicircleButton(label: "", icon: "chevron-left", radius: Constants.Sizes.dPadRedius, isAccent: true, orientation: .left) {
                viewModel.didTapButton(.left)
            }
        }
    }
    
    @ViewBuilder
    private var numpad: some View {
        HStack(spacing: 8) {
            ForEach(viewModel.numpadGrid.indices, id: \.self) { column in
                VStack(spacing: 8) {
                    ForEach(viewModel.numpadGrid[column].indices, id: \.self) { row in
                        if let config = viewModel.numpadGrid[column][row] {
                            SquareButton(
                                label: config.label,
                                icon: config.icon,
                                size: Constants.Sizes.sqButton
                            ) {
                                viewModel.didTapButton(config.type)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var dPadNumpadButton: some View {
        VStack {
            HStack {
                Spacer()
                SquareButton(
                    label: showNumpad ? "" : "123",
                    icon: showNumpad ? "arrows-from-center" : "",
                    size: Constants.Sizes.numpadButton
                ) {
                    showNumpad.toggle()
                }
            }
        }
        .padding(.trailing, 25)
        .padding(.bottom, 15)
    }

    private func offset(for type: RemoteControlViewData, pad: CGFloat) -> CGSize {
        let r = pad * 0.35
        switch type {
        case .up:    return CGSize(width: 0,      height: -r)
        case .down:  return CGSize(width: 0,      height:  r)
        case .left:  return CGSize(width: -r,     height:  0)
        case .right: return CGSize(width:  r,     height:  0)
        case .ok:    return .zero
        default:     return .zero
        }
    }
    
}

// MARK: - Preview

#Preview {
    RemoteControlView()
}
