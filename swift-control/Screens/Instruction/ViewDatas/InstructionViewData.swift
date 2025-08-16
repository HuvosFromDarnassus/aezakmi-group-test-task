//
//  InstructionViewData.swift
//  swift-control
//
//  Created by Daniel Tvorun on 15/08/2025.
//

import SwiftUI

enum InstructionViewData: CaseIterable {
    
    case connect
    case allow
    case find
    case wait
    case allSet
    case open
    
    var illustration: Image {
        switch self {
        case .connect:  .init(.instruction1)
        case .allow:    .init(.instruction2)
        case .find:     .init(.instruction3)
        case .wait:     .init(.instruction4)
        case .allSet:   .init(.instruction5)
        case .open:     .init(.instruction6)
        }
    }
    
    var text: String {
        switch self {
        case .connect:  Strings.Instruction.one
        case .allow:    Strings.Instruction.two
        case .find:     Strings.Instruction.three
        case .wait:     Strings.Instruction.four
        case .allSet:   Strings.Instruction.five
        case .open:     Strings.Instruction.six
        }
    }
    
}
