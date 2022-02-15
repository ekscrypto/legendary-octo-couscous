//
//  BitDiffViewFactory.swift
//  LegendaryOctoCouscous
//
//  Created by Dave Poirier on 2022-02-15.
//  Copyright © 2022 Dave Poirier. All rights reserved.
//

import Foundation

class BitDiffViewFactory {
    
    static func make() -> BitDiffViewController {
        let rootView = BitDiffView()
        let viewModel = BitDiffViewModel()
        return BitDiffViewController(view: rootView, viewModel: viewModel)
    }
}
