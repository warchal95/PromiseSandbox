//
//  ButtonFactory.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit.UIButton

final public class ButtonFactory {
    
    static func navigationButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8117647059, blue: 0.3450980392, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }
}
