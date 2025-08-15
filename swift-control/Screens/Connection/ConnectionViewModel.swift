//
//  ConnectionViewModel.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import SwiftUI

import Lottie

@Observable
final class ConnectionViewModel: ObservableObject {
    
    // MARK: Properties
    
    var devices: [MockDevice] = [] {
        didSet {
            isSearching = false
        }
    }
    var isSearching = true

    private let animationLoader: AnimationLoader
    
    // MARK: Initializers
    
    init(
        animationLoader: AnimationLoader = AnimationLoader()
    ) {
        self.animationLoader = animationLoader
        DeviceManager.shared.delegate = self
    }
    
    // MARK: Events
    
    func getDevices() {
        Task {
            devices = await DeviceManager.shared.getDevices()
        }
    }
    
    func connect(to device: MockDevice) {
        Task {
            await DeviceManager.shared.connect(toDeviceWith: device.id)
        }
    }
    
    func set(pin: String) {
        Task {
            await DeviceManager.shared.set(pin: pin)
        }
    }
    
    func disconnect() {
        Task {
            await DeviceManager.shared.disconnect()
        }
    }
    
    func getSearchAnimation() -> LottieAnimation? {
        animationLoader.load(animation: .searchingTV)
    }
    
}

// MARK: - DeviceManagerDelegate

extension ConnectionViewModel: DeviceManagerDelegate {
    
    func deviceRequestedPin() {
        // TODO: Show pin sheet
    }
    
    func deviceConnectionFailed(with error: ConnectionError) {
        // TODO: Change device cell apperiance
    }
    
    func deviceListUpdated(updatedList: [MockDevice]) {
        devices = updatedList
    }
    
    
}
