//
//  LoadingOverlay.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct LoadingOverlay: View {
    
    // MARK: Body

    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            ProgressView()
                .tint(.accentPrimary)
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }
    }

}
