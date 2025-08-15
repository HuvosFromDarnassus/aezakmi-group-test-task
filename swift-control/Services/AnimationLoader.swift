//
//  AnimationLoader.swift
//  swift-control
//
//  Created by Daniel Tvorun on 14/08/2025.
//

import Foundation

import Lottie

enum Animation {
    
    case searchingTV
    case loadApps
    
    var fileName: String {
        switch self {
        case .searchingTV:
            return "searching TV"
        case .loadApps:
            return "load apps"
        }
    }
    
}

final class AnimationLoader {
    
    func load(animation: Animation) -> LottieAnimation? {
        guard let url = Bundle.main.url(forResource: animation.fileName, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(LottieAnimation.self, from: data)
        } catch {
            return nil
        }
    }
    
}
