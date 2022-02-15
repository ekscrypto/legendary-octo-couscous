//
//  RootViewController.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. Distributed under MIT License

import UIKit

class RootViewController: UIViewController {

    let rootView: RootView = RootView()

    override func loadView() {
        self.view = rootView
        rootView.onCalculate = { print("Will compare bits of \($0) and \($1)") }
    }
}

