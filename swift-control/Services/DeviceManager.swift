//
//  DeviceManager.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import Foundation

protocol DeviceManagerDelegate: AnyObject {
    
    func deviceRequestedPin()
    func deviceConnectionFailed(with error: ConnectionError)
    func deviceListUpdated(updatedList: [MockDevice])
    
}

/// This service emulates the work of searching, connecting, requesting a PIN code
/// and disconnecting from a SmartTV device.
final class DeviceManager {
    
    // MARK: Properties
    
    static var shared: DeviceManager = DeviceManager()
    var currentDevice: MockDevice?
    weak var delegate: DeviceManagerDelegate?
    
    private var devices: [MockDevice] = []
    private var requestedDevice: MockDevice?
    
    // MARK: Initializers
    
    private init() {}
    
    // MARK: Events
    
    func getDevices() async -> [MockDevice] {
        try? await Task.sleep(for: .seconds(3)) // network emulating
        
        devices = [
            .init(id: UUID().uuidString, name: "Mock Device 1", status: .empty, pin: "12345678"),
            .init(id: UUID().uuidString, name: "Mock Device 2", status: .empty, pin: "56789879"),
            .init(id: UUID().uuidString, name: "Mock Device 3", status: .empty, pin: "58724566"),
            .init(id: UUID().uuidString, name: "Mock Device 4", status: .empty, pin: "91783211"),
            .init(id: UUID().uuidString, name: "Mock Device 5", status: .empty, pin: "35781231")
        ]
        
        return devices
    }
    
    func connect(toDeviceWith id: String) async {
        guard let index = devices.firstIndex(where: { id == $0.id }) else {
            delegate?.deviceConnectionFailed(with: .unknown)
            return
        }
        
        try? await Task.sleep(for: .seconds(5)) // network emulating
        
        await disconnect()
        requestedDevice = devices[index]
        update(status: .connection, of: requestedDevice)
        
        delegate?.deviceRequestedPin()
    }
    
    func set(pin: String) async {
        try? await Task.sleep(for: .seconds(5)) // network emulating
        
        if let requestedDevice, requestedDevice.pin == pin {
            update(status: .connected(deviceName: ""), of: requestedDevice)
            currentDevice = requestedDevice
        } else {
            delegate?.deviceConnectionFailed(with: .invalidPIN)
            update(status: .empty, of: requestedDevice)
        }
        
        requestedDevice = nil
    }
    
    func disconnect() async {
        guard let currentDevice else {
            delegate?.deviceConnectionFailed(with: .unknown)
            return
        }
        
        update(status: .disconnected, of: currentDevice)
        
        self.currentDevice = nil
    }
    
    // MARK: Private
    
    private func update(status: ConnectionStatus, of device: MockDevice?) {
        guard
            let device,
            let index = devices.firstIndex(where: { device.id == $0.id })
        else {
            delegate?.deviceConnectionFailed(with: .unknown)
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
