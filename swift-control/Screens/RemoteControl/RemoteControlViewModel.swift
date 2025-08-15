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
    let topButtonsGrid: [[RemoteButtonConfig?]] = [
        [RemoteButtonConfig(isRectangular: true, label: "", icon: "",   type: .channel)],
        [RemoteButtonConfig(label: "", icon: "power",                   type: .power),
         RemoteButtonConfig(label: "", icon: "house",                   type: .home),
         RemoteButtonConfig(label: "", icon: "back",                    type: .back)],
        [RemoteButtonConfig(label: "MENU", icon: "",                    type: .menu),
         RemoteButtonConfig(label: "", icon: "volume-off",              type: .mute),
         RemoteButtonConfig(label: "", icon: "door-enter",              type: .enter)],
        [RemoteButtonConfig(isRectangular: true, label: "", icon: "",   type: .volume)]
    ]
    let dPadGrid: [RemoteButtonConfig?] = [
        RemoteButtonConfig(label: "", icon: "chevron-up",               type: .up),
        RemoteButtonConfig(label: "", icon: "chevron-down",             type: .down),
        RemoteButtonConfig(label: "", icon: "chevron-left",             type: .left),
        RemoteButtonConfig(label: "", icon: "chevron-right",            type: .right),
        RemoteButtonConfig(label: "OK", icon: "",                       type: .ok)
    ]
    let numpadGrid: [[RemoteButtonConfig?]] = [
        [RemoteButtonConfig(label: "1", icon: "",                       type: .one),
         RemoteButtonConfig(label: "4", icon: "",                       type: .four),
         RemoteButtonConfig(label: "7", icon: "",                       type: .seven),
         RemoteButtonConfig(label: "LIST", icon: "",                    type: .list)],
        [RemoteButtonConfig(label: "2", icon: "",                       type: .two),
         RemoteButtonConfig(label: "5", icon: "",                       type: .five),
         RemoteButtonConfig(label: "8", icon: "",                       type: .eight),
         RemoteButtonConfig(label: "0", icon: "",                       type: .zero)],
        [RemoteButtonConfig(label: "3", icon: "",                       type: .three),
         RemoteButtonConfig(label: "6", icon: "",                       type: .six),
         RemoteButtonConfig(label: "9", icon: "",                       type: .nine),
         RemoteButtonConfig(label: "OK", icon: "",                      type: .ok)]
    ]
    
    // MARK: Events
    
    func didTapButton(_ button: RemoteControlViewData) {
        switch button {
        /// Top buttons
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
        /// D-pad
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
        /// Numpad
        case .one:
            print("TAP one")
        case .two:
            print("TAP two")
        case .three:
            print("TAP three")
        case .four:
            print("TAP four")
        case .five:
            print("TAP five")
        case .six:
            print("TAP six")
        case .seven:
            print("TAP seven")
        case .eight:
            print("TAP eight")
        case .nine:
            print("TAP nine")
        case .zero:
            print("TAP zero")
        case .list:
            print("TAP list")
        }
    }
    
}
