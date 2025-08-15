//
//  AlertViewData.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import Foundation

struct AlertViewData: Identifiable {

    let id = UUID()
    let title: String
    let message: String
    let actionTitle: String?
    let action: (() -> Void)?

}
