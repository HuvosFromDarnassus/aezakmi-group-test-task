//
//  RemoteControlViewModel.swift
//  swift-control
//
//  Created by Daniel Tvorun on 13/08/2025.
//

import SwiftUI
import Combine

import WebOSClient

@Observable
@MainActor
final class RemoteControlViewModel: ObservableObject {
    
    // MARK: Properties
    
    var connectionStatus: ConnectionStatus = DeviceManager.shared.currentDevice?.status ?? .empty
    let topButtonsGrid: [[RemoteButtonConfig?]] = [
        [RemoteButtonConfig(isRectangular: true, label: "", icon: "",       type: .channel)],
        [RemoteButtonConfig(isSticky: true, label: "", icon: "power",       type: .power),
         RemoteButtonConfig(label: "", icon: "house",                       type: .home),
         RemoteButtonConfig(label: "", icon: "back",                        type: .back)],
        [RemoteButtonConfig(label: "MENU", icon: "",                        type: .menu),
         RemoteButtonConfig(isSticky: true, label: "", icon: "volume-off",  type: .mute),
         RemoteButtonConfig(label: "", icon: "door-enter",                  type: .enter)],
        [RemoteButtonConfig(isRectangular: true, label: "", icon: "",       type: .volume)]
    ]
    let dPadGrid: [RemoteButtonConfig?] = [
        RemoteButtonConfig(label: "", icon: "chevron-up",                   type: .up),
        RemoteButtonConfig(label: "", icon: "chevron-down",                 type: .down),
        RemoteButtonConfig(label: "", icon: "chevron-left",                 type: .left),
        RemoteButtonConfig(label: "", icon: "chevron-right",                type: .right),
        RemoteButtonConfig(label: "OK", icon: "",                           type: .ok)
    ]
    let numpadGrid: [[RemoteButtonConfig?]] = [
        [RemoteButtonConfig(label: "1", icon: "",                           type: .one),
         RemoteButtonConfig(label: "4", icon: "",                           type: .four),
         RemoteButtonConfig(label: "7", icon: "",                           type: .seven),
         RemoteButtonConfig(label: "LIST", icon: "",                        type: .list)],
        [RemoteButtonConfig(label: "2", icon: "",                           type: .two),
         RemoteButtonConfig(label: "5", icon: "",                           type: .five),
         RemoteButtonConfig(label: "8", icon: "",                           type: .eight),
         RemoteButtonConfig(label: "0", icon: "",                           type: .zero)],
        [RemoteButtonConfig(label: "3", icon: "",                           type: .three),
         RemoteButtonConfig(label: "6", icon: "",                           type: .six),
         RemoteButtonConfig(label: "9", icon: "",                           type: .nine),
         RemoteButtonConfig(label: "OK", icon: "",                          type: .ok)]
    ]
    var alertViewData: AlertViewData?
    
    private var cancellables = Set<AnyCancellable>()
    private var tvToken: String?
    private var tvClient: WebOSClientProtocol?
    
    // MARK: Initializers
    
    init() {
        setupBindings()
    }
    
    // MARK: Events
    
    func setupTvClient(with emulatorIP: String) {
        guard let url = URL(string: "ws://\(emulatorIP):3001") else { return }
        tvClient = WebOSClient(url: url, delegate: self, shouldLogActivity: true)
        tvClient?.connect()
        tvClient?.send(.register(pairingType: .pin, clientKey: tvToken))
    }
    
    func didTapButton(_ button: RemoteControlViewData) {
        guard let tvClient else { return }
        switch button {
        /// Top buttons
        case .nextChannel:      tvClient.sendKey(.channelUp)
        case .previousChannel:  tvClient.sendKey(.channelDown)
        case .power:            tvClient.send(.turnOff)
        case .menu:             tvClient.send(.listApps)
        case .home:             tvClient.sendKey(.home)
        case .mute:             tvClient.sendKey(.mute)
        case .back:             tvClient.sendKey(.back)
        case .enter:            tvClient.sendKey(.enter)
        case .volumeUp:         tvClient.sendKey(.volumeUp)
        case .volumeDown:       tvClient.sendKey(.volumeDown)
        /// D-pad
        case .up:               tvClient.sendKey(.up)
        case .down:             tvClient.sendKey(.down)
        case .left:             tvClient.sendKey(.left)
        case .right:            tvClient.sendKey(.right)
        case .ok:               tvClient.sendKey(.enter)
        /// Numpad
        case .one:              tvClient.sendKey(.num1)
        case .two:              tvClient.sendKey(.num2)
        case .three:            tvClient.sendKey(.num3)
        case .four:             tvClient.sendKey(.num4)
        case .five:             tvClient.sendKey(.num5)
        case .six:              tvClient.sendKey(.num6)
        case .seven:            tvClient.sendKey(.num7)
        case .eight:            tvClient.sendKey(.num8)
        case .nine:             tvClient.sendKey(.num9)
        case .zero:             tvClient.sendKey(.num0)
        case .list:             tvClient.send(.listSources)
        default:
            break
        }
    }
    
    // MARK: Private
    
    private func setupBindings() {
        DeviceManager.shared.deviceConnectionFinished
            .sink { [weak self] result, _ in
                switch result {
                case .success(let device):
                    guard let device else { return }
                    self?.connectionStatus = device.status
                case .failure:
                    break
                }
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - WebOSClientDelegate

extension RemoteControlViewModel: WebOSClientDelegate {

    func didRegister(with clientKey: String) {
        Task { @MainActor in
            tvToken = clientKey
        }
    }
    
    func didConnect() {
        Task { @MainActor in
            alertViewData = AlertViewData(
                title: "Подключение завершено",
                message: "Устройство подключено к эмулятору.",
                actionTitle: "OK",
                action: { [weak self] in
                    self?.alertViewData = nil
                }
            )
        }
    }
    
    func didReceiveNetworkError(_ error: (any Error)?) {
        guard let error else { return }
        Task { @MainActor in
            alertViewData = AlertViewData(
                title: "Error",
                message: error.localizedDescription,
                actionTitle: "OK",
                action: { [weak self] in
                    self?.alertViewData = nil
                }
            )
        }
    }
    
}
