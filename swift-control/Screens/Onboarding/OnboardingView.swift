//
//  OnboardingView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var hasSeenOnboarding: Bool
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            viewModel.currentBackgroundImage
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 2 / 3)

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
                
                ActionButton(title: Strings.Common.continue) {
                    hasSeenOnboarding = viewModel.currentPageIndex == 2
                    viewModel.didTapActionButton()
                }
                .padding(.bottom, 32)
                
                HStack {
                    Text(Strings.Paywall.terms)
                    Spacer()
                    Text(Strings.Paywall.restore)
                    Spacer()
                    Text(Strings.Paywall.privacy)
                }
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 12))
                .foregroundColor(.textAndIcons.opacity(0.5))
                .padding(.horizontal, 16)

                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
        }
        .background(.backgroundPrimary)
        .animation(.easeInOut(duration: 0.25), value: viewModel.currentBackgroundImage)
    }
    
}

#Preview {
    OnboardingView(hasSeenOnboarding: .constant(false))
}
