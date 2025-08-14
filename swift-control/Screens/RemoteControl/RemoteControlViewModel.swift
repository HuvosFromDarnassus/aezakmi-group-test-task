//
//  RemoteControlViewModel.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI

@Observable
final class RemoteControlViewModel: ObservableObject {
    
    // MARK: Properties
    
    var connectionStatus: ConnectionStatus = .empty
    let buttonGrid: [[RemoteButtonConfig?]] = [
        [RemoteButtonConfig(isRectangular: true, label: "", icon: "",   type: .channel)],
        
        [RemoteButtonConfig(label: "", icon: "power",                   type: .power),
         RemoteButtonConfig(label: "", icon: "house",                   type: .home),
         RemoteButtonConfig(label: "", icon: "back",                    type: .back)],
        
        [RemoteButtonConfig(label: "MENU", icon: "",                    type: .menu),
         RemoteButtonConfig(label: "", icon: "volume-off",              type: .mute),
         RemoteButtonConfig(label: "", icon: "door-enter",              type: .enter)],
        
        [RemoteButtonConfig(isRectangular: true, label: "", icon: "",   type: .volume)]
    ]
    let dPad: [RemoteButtonConfig?] = [
        RemoteButtonConfig(label: "", icon: "chevron-up",               type: .up),
        RemoteButtonConfig(label: "", icon: "chevron-down",             type: .down),
        RemoteButtonConfig(label: "", icon: "chevron-left",             type: .left),
        RemoteButtonConfig(label: "", icon: "chevron-right",            type: .right),
        RemoteButtonConfig(label: "OK", icon: "",                       type: .ok)
    ]
    
    // MARK: Events
    
    func didTapButton(_ button: RemoteControlViewData) {
        switch button {
        case .channel:
            print("TAP channel")
        case .nextChannel:
            print("TAP nextChannel")
        case .previousChannel:
            print("TAP previousChannel")
        case .power:
            print("TAP power")
        case .menu:
            print("TAP menu")
        case .home:
            print("TAP home")
        case .mute:
            print("TAP mute")
        case .back:
            print("TAP back")
        case .enter:
            print("TAP enter")
        case .volume:
            print("TAP volume")
        case .volumeUp:
            print("TAP volumeUp")
        case .volumeDown:
            print("TAP volumeDown")
        case .up:
            print("TAP up")
        case .down:
            print("TAP down")
        case .left:
            print("TAP left")
        case .right:
            print("TAP right")
        case .ok:
            print("TAP ok")
        }
    }
    
}

enum ConnectionStatus {
    
    case empty
    case connected(deviceName: String)
    case disconnected
    
    var icon: Image {
        switch self {
        case .empty:        .init(.tvLinethrough)
        case .connected:    .init(.tv)
        case .disconnected: .init(.tvLinethroughRed)
        }
    }
    
    var text: String {
        switch self {
        case .empty:        "Connect to TV"
        case .disconnected: "Disconnected"
        case .connected(let deviceName):
            deviceName
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .empty:        .init(.backgroundPrimary)
        case .connected:    .init(.accentSecondary)
        case .disconnected: .init(.backgroundPrimary)
        }
    }
    
    var textColor: Color {
        switch self {
        case .empty:        .init(.textAndIcons)
        case .connected:    .init(.textAndIcons)
        case .disconnected: .init(.accentPrimary)
        }
    }
    
}
