//
//  BackgroundGradient.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct BackgroundGradient: View {
    
    // MARK: Properties

    let cornerRadius: CGFloat
    let colors: [Color]
    
    // MARK: Body
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
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

}

// MARK: - Preview

#Preview {
    BackgroundGradient(
        cornerRadius: 12,
        colors: [
            .init(.grayGradientLight),
            .init(.grayGradientDark)
        ]
    )
}
