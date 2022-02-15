//
//  BitDiffViewModel.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

protocol BitDiffViewModelCompatible: AnyObject {
    var outcome: String? { get }
    var onOutcome: BitDiffViewModel.OnOutcomeAction? { get set }
    func calculate(_ value1: String, _ value2: String)
}

class BitDiffViewModel: BitDiffViewModelCompatible {
    
    typealias OnOutcomeAction = (String) -> Void
    
    private(set) var outcome: String? { didSet { forwardOutcome() }}
    var onOutcome: OnOutcomeAction? { didSet { forwardOutcome() }}
    
    private func forwardOutcome() {
        if let knownOutcome = outcome {
            onOutcome?(knownOutcome)
        }
    }
    
    func calculate(_ value1: String, _ value2: String) {
        guard let uint1: UInt64 = UInt64(value1),
              let uint2: UInt64 = UInt64(value2)
        else {
            outcome = BitDiffViewErrorMessages.invalidInputs.rawValue
            return
        }
        
        let bits = DifferingBitsCounter<UInt64>.countDifferences(uint1, uint2)
        outcome = BitDiffResultFormatter.format(value1: value1, value2: value2, differingBits: bits)
    }
    
}
