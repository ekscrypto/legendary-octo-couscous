//
//  DifferingBitsCounterTests.swift
//  LegendaryOctoCouscousTests
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest
@testable import LegendaryOctoCouscous

class DifferingBitsCounterTests: XCTestCase {

    struct TestSet<T: BinaryInteger> {
        let value1: T
        let value2: T
        let diff: UInt
    }

    func testUInt8() {
        let testValues: [TestSet<UInt8>] = [
            TestSet(value1: 0x00, value2: 0x00, diff: 0),
            TestSet(value1: 0x00, value2: 0x01, diff: 1),
            TestSet(value1: 0x00, value2: 0x02, diff: 1),
            TestSet(value1: 0x00, value2: 0x03, diff: 2),
            TestSet(value1: 0x01, value2: 0x02, diff: 2),
            TestSet(value1: 0x07, value2: 0x00, diff: 3),
            TestSet(value1: 0x0F, value2: 0x05, diff: 2),
            TestSet(value1: 0xFF, value2: 0x00, diff: 8),
            TestSet(value1: 0x80, value2: 0x00, diff: 1),
            TestSet(value1: 0x00, value2: 0x80, diff: 1)
        ]
        for testValue in testValues {
            XCTAssertEqual(DifferingBitsCounter<UInt8>.countDifferences(testValue.value1, testValue.value2), testValue.diff, "\(testValue.value1) and \(testValue.value2) should differ by only \(testValue.diff) bits")
        }
    }
    
    func testUInt16() {
        let testValues: [TestSet<UInt16>] = [
            TestSet(value1: 0x00F0, value2: 0x0000, diff: 4),
            TestSet(value1: 0x1000, value2: 0x0001, diff: 2),
            TestSet(value1: 0x3701, value2: 0xC8FE, diff: 16),
        ]
        for testValue in testValues {
            XCTAssertEqual(DifferingBitsCounter<UInt16>.countDifferences(testValue.value1, testValue.value2), testValue.diff, "\(testValue.value1) and \(testValue.value2) should differ by only \(testValue.diff) bits")
        }
    }
    
    func testUInt32() {
        let testValues: [TestSet<UInt32>] = [
            TestSet(value1: 0x000000F0, value2: 0x00000000, diff: 4),
            TestSet(value1: 0x10001000, value2: 0x01248001, diff: 7),
            TestSet(value1: 0xC8FE3701, value2: 0x3701C8FE, diff: 32),
        ]
        for testValue in testValues {
            XCTAssertEqual(DifferingBitsCounter<UInt32>.countDifferences(testValue.value1, testValue.value2), testValue.diff, "\(testValue.value1) and \(testValue.value2) should differ by only \(testValue.diff) bits")
        }
    }

}
