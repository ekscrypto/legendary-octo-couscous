//
//  BitDiffViewModelTests.swift
//  LegendaryOctoCouscousTests
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import XCTest
@testable import LegendaryOctoCouscous

class BitDiffViewModelTests: XCTestCase {
    
    let defaultTimeout: TimeInterval = 2.0

    func testRegisterOutcomeAction_noOutcomeYet_noActionExecuted() {
        let viewModel = BitDiffViewModel()
        viewModel.onOutcome = { _ in
            XCTFail("Outcome action should only be called if an outcome is already known")
        }
    }
    
    func testRegisterOutcomeAction_existingKnownOutcome_actionExecuted() {
        let viewModel = BitDiffViewModel()
        viewModel.calculate("1", "2")
        let outcomeActionExecutedExpectation: XCTestExpectation = XCTestExpectation(description: "onOutcome should be executed when registered if an outcome is already known")
        viewModel.onOutcome = { outcome in
            XCTAssertEqual(viewModel.outcome, outcome)
            outcomeActionExecutedExpectation.fulfill()
        }
        wait(for: [outcomeActionExecutedExpectation], timeout: defaultTimeout)
    }
    
    func testOutcomeText_invalidValue1_expectInvalidValuesMessage() {
        let viewModel = BitDiffViewModel()
        viewModel.calculate("a", "3")
        XCTAssertEqual(viewModel.outcome, BitDiffViewErrorMessages.invalidInputs.rawValue)
    }

    func testOutcomeText_invalidValue2_expectInvalidValuesMessage() {
        let viewModel = BitDiffViewModel()
        viewModel.calculate("5", "b")
        XCTAssertEqual(viewModel.outcome, BitDiffViewErrorMessages.invalidInputs.rawValue)
    }
    
    func testOutcomeText_emptyValues_expectingInvalidValuesMessage() {
        let viewModel = BitDiffViewModel()
        viewModel.calculate("", "")
        XCTAssertEqual(viewModel.outcome, BitDiffViewErrorMessages.invalidInputs.rawValue)
    }
    
    func testOutcomeText_negativeValues_expectingInvalidValuesMessage() {
        let viewModel = BitDiffViewModel()
        viewModel.calculate("-1", "10")
        XCTAssertEqual(viewModel.outcome, BitDiffViewErrorMessages.invalidInputs.rawValue)
    }

    func testOutcomeText_valueExceedingMax_expectingInvalidValuesMessage() {
        let viewModel = BitDiffViewModel()
        viewModel.calculate("3\(UInt64.max)", "10")
        XCTAssertEqual(viewModel.outcome, BitDiffViewErrorMessages.invalidInputs.rawValue)
    }
    
    func testOutcomeText_values0and1_expectingFormattedOutcome() {
        let viewModel = BitDiffViewModel()
        let expectedOutcome = BitDiffResultFormatter.format(value1: "0", value2: "1", differingBits: 1)
        viewModel.calculate("0", "1")
        XCTAssertEqual(viewModel.outcome, expectedOutcome)
    }
}
