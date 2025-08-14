//
//  UIViewControllerRepresentable.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    // MARK: Properties

    let activityItems: [Any]
    
    // MARK: UIViewControllerRepresentable

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}

}
