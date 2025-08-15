//
//  ConnectionTryAgainView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

struct ConnectionTryAgainView: View {
    
    // MARK: Properties

    let action: () -> Void
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color(.backgroundSecondary)
            
            VStack {
                Text(Strings.Connection.notFound)
                    .font(Fonts.Roboto.regular.swiftUIFont(fixedSize: 15))
                    .foregroundStyle(.textAndIcons.opacity(0.5))
                
                ActionButton(title: Strings.Common.tryAgain, action: action)
            }
        }
        .frame(height: 78)
        .listRowBackground(Color.clear)
    }
    
}

#Preview {
    ConnectionTryAgainView {}
}
