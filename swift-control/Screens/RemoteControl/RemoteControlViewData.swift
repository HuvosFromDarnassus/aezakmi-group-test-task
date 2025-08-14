//
//  RemoteControlViewData.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

enum RemoteControlViewData: CaseIterable {
    
    /// Buttons grid
    case channel
    case nextChannel
    case previousChannel
    case power
    case menu
    case home
    case mute
    case back
    case enter
    case volume
    case volumeUp
    case volumeDown
    /// D-pad
    case up
    case down
    case left
    case right
    case ok
    /// Numpad
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case zero
    case list

}

struct RemoteButtonConfig: Identifiable {
    
    let id = UUID()
    let isRectangular: Bool
    let label: String
    let icon: String
    let type: RemoteControlViewData
    
    init(
        isRectangular: Bool = false,
        label: String,
        icon: String,
        type: RemoteControlViewData
    ) {
        self.isRectangular = isRectangular
        self.label = label
        self.icon = icon
        self.type = type
    }

}
