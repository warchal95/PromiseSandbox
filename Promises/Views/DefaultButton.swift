//
//  DefaultButton.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit.UIButton

final class DefaultButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperties() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8117647059, blue: 0.3450980392, alpha: 1)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 8.0
    }
}
