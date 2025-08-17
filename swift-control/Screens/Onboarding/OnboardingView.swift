//
//  OnboardingView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: Properties
    
    @Binding var hasSeenOnboarding: Bool
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var showWebView = false
    @State private var urlToOpen: URL?
    @State private var showPaywall = false
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            viewModel.currentBackgroundImage
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                if viewModel.currentPageIndex == 1 {
                    fakeReviews
                        .frame(height: UIScreen.main.bounds.height * 2 / 3.16)
                } else {
                    Spacer()
                        .frame(height: UIScreen.main.bounds.height * 2 / 3.1)
                }
                
                textContent
                
                ActionButton(title: Strings.Common.continue) {
                    showPaywall = viewModel.currentPageIndex == 2
                    viewModel.didTapActionButton()
                }
                .padding(.bottom, 32)
                
                bottomButtons
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
        }
        .background(.backgroundPrimary)
        .animation(.easeInOut(duration: 0.25), value: viewModel.currentBackgroundImage)
        .sheet(isPresented: $showWebView) {
            showWebView = false
        } content: {
            if let urlToOpen {
                SafariView(url: urlToOpen)
                    .presentationDetents([.fraction(0.99)])
                    .presentationDragIndicator(.hidden)
                    .presentationBackground(.clear)
                    .presentationCornerRadius(20)
                    .presentationContentInteraction(.scrolls)
                    .presentationCompactAdaptation(.none)
            }
        }
        .fullScreenCover(isPresented: $showPaywall) {
            showPaywall = false
        } content: {
            PaywallView(hasSeenOnboarding: $hasSeenOnboarding) {
                showPaywall = false
                hasSeenOnboarding = true
            }
        }
    }
    
    // MARK: Views
    
    private var fakeReviews: some View {
        VStack(alignment: .center, spacing: 21) {
            ForEach(OnboardingFakeReviewsViewData.allCases, id: \.self) { review in
                FakeReviewView(viewData: review)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private var textContent: some View {
        Text(viewModel.currentTitle)
            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 28))
            .foregroundColor(.textAndIcons)
            .animation(.easeInOut(duration: 0.25), value: viewModel.currentTitle)
            .padding(.bottom, 12)
        Text(viewModel.currentSubtitle)
            .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 17))
            .foregroundColor(.textAndIcons.opacity(0.5))
            .animation(.easeInOut(duration: 0.25), value: viewModel.currentSubtitle)
            .padding(.bottom, 16)
    }
    
    private var bottomButtons: some View {
        HStack {
            Button(Strings.Paywall.terms) {
                urlToOpen = URL(string: "https://www.google.com")
                showWebView = true
            }
            Spacer()
            Button(Strings.Paywall.restore) {}
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
    OnboardingView(hasSeenOnboarding: .constant(false))
}
