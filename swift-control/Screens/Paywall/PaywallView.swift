//
//  PaywallView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

struct PaywallView: View {

    // MARK: Properties
    
    @Binding var hasSeenOnboarding: Bool
    var onClose: (() -> Void)?
    @State private var showWebView = false
    @State private var urlToOpen: URL?
    @State private var trialEnabled = false
    @State private var isLoading = false
    private let mockPrice: String = "$4.99/week"
    
    // MARK: Body

    var body: some View {
        ZStack {
            Image(.paywallIllustration)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            closeButton
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height / 2.3)

                featuresList
                textAndToggle
                actionButton
                bottomButtons

                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            
            if isLoading {
                LoadingOverlay()
                    .transition(.opacity)
                    .zIndex(10)
            }
        }
        .background(.backgroundPrimary)
        .fullScreenCover(isPresented: $showWebView) {
            showWebView = false
        } content: {
            if let urlToOpen {
                SafariView(url: urlToOpen)
            }
        }
    }
    
    // MARK: Private
    
    @ViewBuilder
    private var closeButton: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    onClose?()
                } label: {
                    Image(.close)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .background(.textAndIcons.opacity(0.2))
                        .clipShape(Circle())
                }
                .frame(width: 56, height: 56)
                .padding(.top, 52)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private var featuresList: some View {
        HStack(alignment: .center, spacing: 9) {
            ForEach(PaywallFeaturesViewData.allCases, id: \.self) { feature in
                PaywallFeatureView(icon: feature.icon, text: feature.text)
            }
        }
    }
    
    @ViewBuilder
    private var textAndToggle: some View {
        Text(Strings.Paywall.title)
            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 28))
            .foregroundColor(.textAndIcons)

        Text(trialEnabled ? Strings.Paywall.Subtitle.withTrial(mockPrice) : Strings.Paywall.subtitle(mockPrice))
            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
            .foregroundColor(.textAndIcons.opacity(0.5))
            .animation(.easeInOut, value: trialEnabled)
        
        Toggle(isOn: $trialEnabled) {
            Text(trialEnabled ? Strings.Paywall.Trial.enabled : Strings.Paywall.Trial.disabled)
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
                .foregroundColor(.textAndIcons.opacity(0.5))
                .animation(.easeInOut, value: trialEnabled)
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
        .background(.textAndIcons.opacity(0.15))
        .cornerRadius(15)
    }
    
    @ViewBuilder
    private var actionButton: some View {
        ActionButton(title: Strings.Common.continue) {
            isLoading = true
            Task {
                try await Task.sleep(for: .seconds(2))
                isLoading = false
                hasSeenOnboarding = true
            }
        }
        .padding(.bottom, 16)
    }
    
    @ViewBuilder
    private var bottomButtons: some View {
        HStack {
            Button(Strings.Paywall.terms) {
                urlToOpen = URL(string: "https://www.google.com")
                showWebView = true
            }
            Spacer()
            Button(Strings.Paywall.restore) {
                isLoading = true
                Task {
                    try await Task.sleep(for: .seconds(2))
                    isLoading = false
                    hasSeenOnboarding = true
                }
            }
            Spacer()
            Button(Strings.Paywall.privacy) {
                urlToOpen = URL(string: "https://www.google.com")
                showWebView = true
            }
        }
        .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 12))
        .foregroundColor(.textAndIcons.opacity(0.5))
        .padding(.horizontal, 16)
    }

}

// MARK: - Preview

#Preview {
    PaywallView(hasSeenOnboarding: .constant(false))
}
