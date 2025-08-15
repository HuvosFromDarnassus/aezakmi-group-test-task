//
//  ConnectionStatus.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import SwiftUI

enum ConnectionStatus {
    
    case empty
    case connection
    case connected(deviceName: String)
    case disconnected
    case error
    
    var statusBarIcon: Image {
        switch self {
        case .empty:        .init(.tvLinethrough)
        case .connected:    .init(.tv)
        case .disconnected: .init(.tvLinethroughRed)
        default:
                .init(.tv)
        }
    }
    
    var statusBarText: String {
        switch self {
        case .empty:        Strings.Main.StatusBar.notSelected
        case .disconnected: Strings.Main.StatusBar.disconnected
        case .connected(let deviceName):
            deviceName
        default:
            Strings.Main.StatusBar.notSelected
        }
    }
    
    var statusBarBackgroundColor: Color {
        switch self {
        case .empty:        .init(.backgroundPrimary)
        case .connected:    .init(.accentSecondary)
        case .disconnected: .init(.backgroundPrimary)
        default:
                .init(.backgroundPrimary)
        }
    }
    
    var statusBarTextColor: Color {
        switch self {
        case .empty:        .init(.textAndIcons)
        case .connected:    .init(.textAndIcons)
        case .disconnected: .init(.accentPrimary)
        default:
                .init(.textAndIcons)
        }
    }
    
    var deviceCellText: String {
        switch self {
        case .empty:        Strings.Connection.Status.empty
        case .connection:   Strings.Connection.Status.connection
        case .disconnected: Strings.Connection.Status.disconnected
        case .connected:    Strings.Connection.Status.connected
        case .error:        Strings.Connection.Status.error
        }
    }
    
    var deviceCellBackgroundColor: Color {
        switch self {
        case .empty:        .init(.backgroundSecondary)
        case .connection:   .init(.backgroundSecondary)
        case .connected:    .init(.accentPrimary)
        case .disconnected: .init(.backgroundSecondary)
        case .error:        .init(.backgroundSecondary)
        }
    }
    
    var deviceCellTextColor: Color {
        switch self {
        case .empty:        .init(.textAndIcons)
        case .connection:   .init(.textAndIcons)
        case .connected:    .init(.textAndIcons)
        case .disconnected: .init(.accentPrimary)
        case .error:        .init(.accentPrimary)
        }
    }
    
}
