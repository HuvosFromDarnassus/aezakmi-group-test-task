//
//  FakeReviewView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

struct FakeReviewView: View {
    
    // MARK: Properties
    
    let viewData: OnboardingFakeReviewsViewData
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(viewData.title)
                .font(Fonts.Roboto.bold.swiftUIFont(fixedSize: 12))
                .foregroundStyle(.textAndIcons)
            
            HStack(spacing: 6) {
                HStack(spacing: 0) {
                    ForEach(0..<viewData.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundStyle(.orange)
                            .frame(width: 15, height: 15)
                    }
                    
                    if viewData.rating < 5 {
                        ForEach(0..<(5 - viewData.rating), id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundStyle(.gray)
                                .frame(width: 15, height: 15)
                        }
                    }
                }
                Text(viewData.author)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 12))
                    .foregroundStyle(.textAndIcons)
                
                Spacer()
            }
            
            Text(viewData.text)
                .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 12))
                .foregroundStyle(.textAndIcons)
        }
        .padding(20)
        .frame(width: 250, height: 117)
        .background(.ultraThinMaterial)
        .cornerRadius(25)
    }
    
}

// MARK: Preview

#Preview {
    ZStack {
        Image(.onboardingSecond)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
        FakeReviewView(viewData: .first)
    }
}
