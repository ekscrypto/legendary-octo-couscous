//
//  DifferingBitsCounter.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class DifferingBitsCounter<T: BinaryInteger> {
    static func countDifferences(_ value1: T, _ value2: T) -> UInt {
        var diff: T = value1 ^ value2
        var numberOfBits: UInt = 0
        while diff > 0 {
            numberOfBits += UInt(diff & 0x01)
            diff = diff >> 1
        }
        return numberOfBits
    }
}
