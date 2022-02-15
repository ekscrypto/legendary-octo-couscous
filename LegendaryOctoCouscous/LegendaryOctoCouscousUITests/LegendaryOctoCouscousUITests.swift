//
//  LegendaryOctoCouscousUITests.swift
//  LegendaryOctoCouscousUITests
//
//  Created by Dave Poirier on 2022-02-15.
//

import XCTest

class LegendaryOctoCouscousUITests: XCTestCase {
    
    let defaultTimeout: TimeInterval = 2.0
    
    override func setUp() {
        continueAfterFailure = false
    }

    private func entering(value1: String, value2: String, expecting expectedOutcome: String) {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.textFields[BitDiffViewAccessibility.number1TextField.rawValue].waitForExistence(timeout: defaultTimeout))
        
        app.textFields[BitDiffViewAccessibility.number1TextField.rawValue].tap()
        app.textFields[BitDiffViewAccessibility.number1TextField.rawValue].typeText(value1)
        
        app.textFields[BitDiffViewAccessibility.number2TextField.rawValue].tap()
        app.textFields[BitDiffViewAccessibility.number2TextField.rawValue].typeText(value2)
        
        app.buttons[BitDiffViewAccessibility.calculateButton.rawValue].tap()
        XCTAssertTrue(app.staticTexts[BitDiffViewAccessibility.numberOfBitsLabel.rawValue].waitForExistence(timeout: defaultTimeout))
        XCTAssertEqual(app.staticTexts[BitDiffViewAccessibility.numberOfBitsLabel.rawValue].label, expectedOutcome)
    }
    
    func testMaximumAndMinimumValues() {
        let maximumValue = "\(UInt64.max)"
        let minimumValue = "0"
        let expectedOutcomeMaxMin = BitDiffResultFormatter.format(value1: maximumValue, value2: minimumValue, differingBits: 64)
        entering(value1: maximumValue, value2: minimumValue, expecting: expectedOutcomeMaxMin)
        let expectedOutcomeMinMax = BitDiffResultFormatter.format(value1: minimumValue, value2: maximumValue, differingBits: 64)
        entering(value1: minimumValue, value2: maximumValue, expecting: expectedOutcomeMinMax)
    }

    func testInvalidValues() {
        entering(value1: "a", value2: "", expecting: BitDiffViewErrorMessages.invalidInputs.rawValue)
    }
    
}
