//
//  BitDiffViewController.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. Distributed under MIT License

import UIKit

class BitDiffViewController: UIViewController {

    let rootView: BitDiffViewCompatible
    let viewModel: BitDiffViewModelCompatible
    
    init(view: BitDiffViewCompatible, viewModel: BitDiffViewModelCompatible) {
        self.rootView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        rootView.onCalculate = { [weak self] value1, value2 in self?.viewModel.calculate(value1, value2) }
        viewModel.onOutcome = { [weak self] outcome in self?.rootView.setOutcome(outcome) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
}

