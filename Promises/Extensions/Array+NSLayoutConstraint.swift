//
//  Array+NSLayoutConstraint.swift
//  Teamy-Remote
//
//  Copyright © 2017 Netguru Sp. z o.o. All rights reserved.
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

