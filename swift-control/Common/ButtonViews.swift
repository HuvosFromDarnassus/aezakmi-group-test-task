//
//  ButtonViews.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.textAndIcons)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.accentPrimary)
                .cornerRadius(15)
        }
    }

}

#Preview {
    ActionButton(title: "Continue") {
        print("Tap")
    }
}
