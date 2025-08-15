//
//  ConnectionViewModel.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import SwiftUI
import Combine

import Lottie

@Observable
@MainActor
final class ConnectionViewModel: ObservableObject {
    
    // MARK: Properties
    
    var devices: [MockDevice] = [] {
        didSet {
            isSearching = false
        }
    }
    var isSearching = true
    var showPinView = false
    var errorMessage: String?
    var alertViewData: AlertViewData?
    
    private let animationLoader: AnimationLoader
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Initializers
    
    init(
        animationLoader: AnimationLoader = AnimationLoader()
    ) {
        self.animationLoader = animationLoader
        
        DeviceManager.shared.deviceRequestedPin
            .sink { [weak self] in
                self?.showPinView = true
                self?.errorMessage = nil
            }
            .store(in: &cancellables)
        
        DeviceManager.shared.deviceConnectionFinished
            .sink { [weak self] result, updatedList in
                guard let self else { return }
                devices = updatedList
                switch result {
                case .success:
                    showPinView = false
                    errorMessage = nil
                case .failure(let error):
                    errorMessage = error.description
                }
            }
            .store(in: &cancellables)
        
        DeviceManager.shared.selectedDeviceConnected
            .sink { [weak self] in
                self?.alertViewData = AlertViewData(
                    title: "Disconnect from TV?",
                    message: "You can connect again by tapping on the device card",
                    actionTitle: "Disconnect"
                ) {
                    Task {
                        await DeviceManager.shared.disconnect()
                    }
                }
            }
            .store(in: &cancellables)
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
