//
//  Array+NSLayoutConstraintExtension.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit.NSLayoutConstraint

public extension Array where Element: NSLayoutConstraint {
    
    private func setActive(_ active: Bool) {
        active ? NSLayoutConstraint.activate(self) : NSLayoutConstraint.deactivate(self)
    }
    
    func activate() {
        setActive(true)
    }
}

