//
//  LayoutBuilder.swift
//  Teamy-Remote
//
//  Copyright © 2017 Netguru Sp. z o.o. All rights reserved.
//

import UIKit.NSLayoutConstraint

typealias IdentifiableView = (identifier: String, view: UIView)

public final class LayoutBuilder {
    fileprivate let views: [String : UIView]
    
    init(views: [IdentifiableView] = []) {
        var dictionary: [String : UIView] = [:]
        views.forEach { dictionary[$0.identifier] = $0.view }
        
        self.views = dictionary
    }
}

public extension LayoutBuilder {
    typealias LayoutAttribute = (CGFloat, NSLayoutAttribute, CGFloat)
    
    func with(format: String, options: NSLayoutFormatOptions = [], metrics: [String : Any]? = nil) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraints(withVisualFormat: format,
                                              options: options,
                                              metrics: metrics,
                                              views: views)
    }
    
    func with(first: UIView, second: UIView, attributes: [LayoutAttribute]) -> [NSLayoutConstraint] {
        return attributes.map {
            NSLayoutConstraint(item: first, attribute: $0.1, relatedBy: .equal,
                               toItem: second, attribute: $0.1, multiplier: $0.2, constant: $0.0)
        }
    }
}

public extension LayoutBuilder {
    
    func keepRatio(_ ratio: CGFloat, of view: UIView) {
        [NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal,
                            toItem: view, attribute: .height, multiplier: ratio, constant: 0.0)].activate()
    }
    
    func center(_ view: UIView, in otherView: UIView, offset: (CGFloat, CGFloat) = (0, 0)) {
        let attributes: [LayoutAttribute] = [
            (offset.0, .centerX, 1.0),
            (offset.1, .centerY, 1.0)
        ]
        
        with(first: view, second: otherView, attributes: attributes).activate()
    }
    
    func pin(_ view: UIView, to otherView: UIView, edges: UIEdgeInsets = .zero) {
        let attributes: [LayoutAttribute] = [
            (edges.left, .left, 1.0),
            (edges.right, .right, 1.0),
            (edges.top, .top, 1.0),
            (edges.bottom, .bottom, 1.0)
        ]
        
        with(first: view, second: otherView, attributes: attributes).activate()
    }
}
