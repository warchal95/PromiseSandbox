//
//  View.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit

public class View: UIView {
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
        setupProperties()
        setupCallbacks()
        setupBehaviour()
    }
    
    @available(*, unavailable, message: "Use init(frame:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Abstract
    /// Sets up the properties of `self`. Called automatically on `init()`.
    internal func setupProperties() {
        // no-op by default
    }
    
    /// Sets up layout and subviews in `self`. Called automatically on `init()`.
    internal func setupLayout() {
        // no-op by default
    }
    
    /// Sets up callbacks in `self`. Called automatically on `init()`.
    internal func setupCallbacks() {
        // no-op by default
    }
    
    /// Sets up behaviour in `self`. Called automatically on `init()`.
    internal func setupBehaviour() {
        // no-op by default
    }
}
