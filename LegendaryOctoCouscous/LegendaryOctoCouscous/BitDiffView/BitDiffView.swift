//
//  BitDiffView.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. Distributed under MIT License
//

import UIKit

protocol BitDiffViewCompatible: UIView {
    var onCalculate: BitDiffView.CalculateAction? { get set }
    func setOutcome(_ outcome: String)
}

class BitDiffView: UIView, BitDiffViewCompatible {
    
    typealias CalculateAction = (String, String) -> Void
    var onCalculate: CalculateAction?
    
    enum Style {
        static let topMargin: CGFloat = 80.0
        static let sideMargins: CGFloat = 25.0
        static let fieldsSpacing: CGFloat = 5.0
        static let resultsTopMargin: CGFloat = 60.0
    }

    private let directivesLabel: UILabel = label(for: "Enter two numbers and tap Calculate")
    private let number1TextField: UITextField = numberTextField()
    private let number2TextField: UITextField = numberTextField()
    private let numberOfBitsLabel: UILabel = label(for: "")
    private lazy var calculateButton: UIButton = formButton()
    
    func setOutcome(_ outcome: String) {
        numberOfBitsLabel.text = outcome
    }
    
    private static func numberTextField() -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .no
        textField.textColor = .label
        textField.tintColor = .placeholderText
        textField.placeholder = "Unsigned 64-bit integer…"
        return textField
    }
    
    private static func label(for text: String) -> UILabel {
        let label: UILabel = UILabel()
        label.text = text
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }
    
    private func formButton() -> UIButton {
        let button = UIButton(type: .custom, primaryAction: UIAction(handler: { [weak self] _ in
            self?.triggerCalculateAction()
        }))
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }
    
    private func triggerCalculateAction() {
        let firstDigits: String = number1TextField.text ?? ""
        let secondDigits: String = number2TextField.text ?? ""
        onCalculate?(firstDigits, secondDigits)
    }
    
    private func prepareAccessibilityIdentifiers() {
        number1TextField.accessibilityIdentifier = BitDiffViewAccessibility.number1TextField.rawValue
        number2TextField.accessibilityIdentifier = BitDiffViewAccessibility.number2TextField.rawValue
        calculateButton.accessibilityIdentifier = BitDiffViewAccessibility.calculateButton.rawValue
        numberOfBitsLabel.accessibilityIdentifier = BitDiffViewAccessibility.numberOfBitsLabel.rawValue
    }
    
    private func composeUI() {
        self.backgroundColor = .systemBackground
        
        [directivesLabel, number1TextField, number2TextField, calculateButton, numberOfBitsLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            directivesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Style.topMargin),
            directivesLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Style.sideMargins),
            directivesLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Style.sideMargins),
            number1TextField.topAnchor.constraint(equalTo: directivesLabel.bottomAnchor, constant: Style.fieldsSpacing),
            number1TextField.leadingAnchor.constraint(equalTo: directivesLabel.leadingAnchor),
            number1TextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Style.sideMargins),
            number2TextField.topAnchor.constraint(equalTo: number1TextField.bottomAnchor, constant: Style.fieldsSpacing),
            number2TextField.leadingAnchor.constraint(equalTo: number1TextField.leadingAnchor),
            number2TextField.trailingAnchor.constraint(equalTo: number1TextField.trailingAnchor),
            calculateButton.topAnchor.constraint(equalTo: number2TextField.bottomAnchor, constant: Style.fieldsSpacing),
            calculateButton.trailingAnchor.constraint(equalTo: number2TextField.trailingAnchor),
            calculateButton.leadingAnchor.constraint(greaterThanOrEqualTo: number2TextField.leadingAnchor),
            numberOfBitsLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: Style.resultsTopMargin),
            numberOfBitsLabel.leadingAnchor.constraint(greaterThanOrEqualTo: directivesLabel.leadingAnchor),
            numberOfBitsLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    override func layoutSubviews() {
        if directivesLabel.superview == nil {
            composeUI()
            prepareAccessibilityIdentifiers()
        }
        super.layoutSubviews()
    }
}
