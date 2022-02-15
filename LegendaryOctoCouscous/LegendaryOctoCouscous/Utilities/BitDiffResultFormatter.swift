//
//  BitDiffResultFormatter.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class BitDiffResultFormatter {
    static func format(value1: String, value2: String, differingBits: UInt) -> String {
        "\(value1) and \(value2) differ by \(differingBits) bit(s)"
    }
}
