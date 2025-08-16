//
//  DeviceManager.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import Foundation
import Combine

@MainActor
final class DeviceManager {
    
    // MARK: Properties
    
    static let shared = DeviceManager()
    
    let deviceRequestedPin = PassthroughSubject<Void, Never>()
    let selectedDeviceConnected = PassthroughSubject<Void, Never>()
    let deviceConnectionFinished = PassthroughSubject<(Result<MockDevice?, ConnectionError>, [MockDevice]), Never>()

    private(set) var currentDevice: MockDevice?
    private var devices: [MockDevice] = []
    private var requestedDevice: MockDevice?
    
    // MARK: Initializers
    
    private init() {}
    
    // MARK: Events
    
    func getDevices() async -> [MockDevice] {
        try? await Task.sleep(for: .seconds(3.5)) // network simulation
        
        if devices.isEmpty {
            devices = [
                .init(id: UUID().uuidString, name: "Mock Device 1", status: .empty, pin: "123456"),
                .init(id: UUID().uuidString, name: "Mock Device 2", status: .empty, pin: "567898"),
                .init(id: UUID().uuidString, name: "Mock Device 3", status: .empty, pin: "587245"),
                .init(id: UUID().uuidString, name: "Mock Device 4", status: .empty, pin: "917832"),
                .init(id: UUID().uuidString, name: "Mock Device 5", status: .empty, pin: "357812")
            ]
        }
        
        return devices
    }
    
    func connect(toDeviceWith id: String) async {
        guard let index = devices.firstIndex(where: { id == $0.id }) else {
            deviceConnectionFinished.send((.failure(.unknown), devices))
            return
        }
        
        switch devices[index].status {
        case .connected:
            selectedDeviceConnected.send()
        default:
            requestedDevice = devices[index]
            await update(status: .connection, of: requestedDevice)
            deviceConnectionFinished.send((.success(nil), devices))
            
            try? await Task.sleep(for: .seconds(2)) // network simulation
            
            deviceRequestedPin.send()
        }
    }
    
    func set(pin: String) async {
        try? await Task.sleep(for: .seconds(2)) // network simulation
        
        if let requestedDevice, requestedDevice.pin == pin {
            await disconnect()
            await update(status: .connected(deviceName: requestedDevice.name), of: requestedDevice)
            let requestedDevice = devices.first(where: { $0.id == requestedDevice.id })
            currentDevice = requestedDevice
            deviceConnectionFinished.send((.success(currentDevice), devices))
            self.requestedDevice = nil
        } else {
            await update(status: .empty, of: requestedDevice)
            deviceConnectionFinished.send((.failure(.invalidPIN), devices))
        }
    }
    
    func disconnect() async {
        guard let currentDevice else {
            deviceConnectionFinished.send((.failure(.unknown), devices))
            return
        }
        
        await update(status: .disconnected, of: currentDevice)
        let updatedCurrentDevice = devices.first(where: { $0.id == currentDevice.id })
        deviceConnectionFinished.send((.success(updatedCurrentDevice), devices))
        
        self.currentDevice = updatedCurrentDevice
    }
    
    // MARK: Private

    private func update(status: ConnectionStatus, of device: MockDevice?) async {
        guard
            let device,
            let index = devices.firstIndex(where: { device.id == $0.id })
        else {
            deviceConnectionFinished.send((.failure(.unknown), devices))
            return
        }
        
        devices[index].status = status
    }

}

enum ConnectionError: Error {
    
    case invalidPIN
    case timeout
    case unknown
    
    var description: String {
        switch self {
        case .invalidPIN:   Strings.Connection.Pairing.error
        case .timeout:      "Timeout"
        case .unknown:      "Unknown error"
        }
    }
    
}
