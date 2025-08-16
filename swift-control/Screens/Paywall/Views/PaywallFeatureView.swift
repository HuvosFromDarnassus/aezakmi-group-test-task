//
//  PaywallFeatureView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

struct PaywallFeatureView: View {
    
    // MARK: Properties
    
    let icon: Image
    let text: String
    private let width: CGFloat = UIScreen.main.bounds.width / 2.25
    
    // MARK: Body
    
    var body: some View {
        VStack {
            icon
                .frame(width: 16, height: 16)
            
            Text(text)
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 15))
                .foregroundStyle(.textAndIcons)
                .multilineTextAlignment(.center)
        }
        .padding(16)
        .frame(width: width, height: 100)
        .background(.ultraThinMaterial)
        .cornerRadius(25)
    }
}

#Preview {
    ZStack {
        Image(.paywallIllustration)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
        PaywallFeatureView(
            icon: .init(.paywallFeatureOne),
            text: "Access to video services on TV"
        )
    }
}
