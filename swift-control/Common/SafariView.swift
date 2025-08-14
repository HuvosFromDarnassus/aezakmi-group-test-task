//
//  SafariView.swift
//  swift-control
//
//  Created by Daniel Tvorun on 12/08/2025.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    // MARK: Properties

    let url: URL
    
    // MARK: UIViewControllerRepresentable

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}

}
