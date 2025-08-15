//
//  BackgroundGradient.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct BackgroundGradient: View {
    
    // MARK: Properties

    enum BackgroundShape {
        case rect, circle
    }
    
    let shape: BackgroundShape
    let cornerRadius: CGFloat
    let colors: [Color]
    
    // MARK: Body
    
    var body: some View {
        shapeView
            .shadow(color: Color.black.opacity(0.5), radius: 6, x: 4, y: 4)
            .shadow(color: Color.white.opacity(0.05), radius: 2, x: -2, y: -2)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(0.15),
                                Color.clear
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
                    .blendMode(.overlay)
            )
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var shapeView: some View {
        switch shape {
        case .rect:
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
        case .circle:
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
        }
    }

}

// MARK: - Preview

#Preview {
    VStack(spacing: 20) {
        BackgroundGradient(
            shape: .rect,
            cornerRadius: 12,
            colors: [
                .init(.grayGradientLight),
                .init(.grayGradientDark)
            ]
        )
        BackgroundGradient(
            shape: .circle,
            cornerRadius: 12,
            colors: [
                .init(.accentPrimary),
                .init(.accentSecondary)
            ]
        )
    }
}
