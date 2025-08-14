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
    
    private enum Constants {
        enum Sizes {
            static let statusBarHeight: CGFloat = 50
            static let sqButton: CGFloat = 70
            static let recButtonWidth: CGFloat = 84
            static let recButtonHegiht: CGFloat = 232
            static let dPadSize: CGFloat = UIScreen.main.bounds.width - 102
        }
    }
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundPrimary)
                .ignoresSafeArea()
            VStack(spacing: 34) {
                statusBar
                buttonGrid
                dPad
                Spacer()
            }
        }
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var statusBar: some View {
        ZStack {
            BackgroundGradient(
                cornerRadius: 16,
                colors: [viewModel.connectionStatus.backgroundColor]
            )
            HStack(spacing: 11) {
                viewModel.connectionStatus.icon
                    .foregroundColor(viewModel.connectionStatus.textColor)
                Text(viewModel.connectionStatus.text)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                    .foregroundColor(viewModel.connectionStatus.textColor)
            }
        }
        .frame(height: Constants.Sizes.statusBarHeight)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private var buttonGrid: some View {
        HStack(spacing: 12) {
            ForEach(viewModel.buttonGrid.indices, id: \.self) { column in
                VStack(spacing: 11) {
                    ForEach(viewModel.buttonGrid[column].indices, id: \.self) { row in
                        if let config = viewModel.buttonGrid[column][row] {
                            if config.isRectangular {
                                defineRectangularButton(by: config)
                            } else {
                                RemoteSquareButton(
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
            RemoteRectangleButton(
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
            RemoteRectangleButton(
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
            ForEach(viewModel.dPad.compactMap { $0 }, id: \.type) { config in
                let pad = Constants.Sizes.dPadSize
                let isCenter = (config.type == .ok)
                let side: CGFloat = pad * (isCenter ? 0.25 : 0.3)

                RemoteSquareButton(
                    label: config.label,
                    icon: config.icon,
                    size: side,
                    isAccent: true
                ) {
                    viewModel.didTapButton(config.type)
                }
                .frame(width: side, height: side)
                .offset(offset(for: config.type, pad: pad))
            }
        }
        .frame(width: Constants.Sizes.dPadSize, height: Constants.Sizes.dPadSize)
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
