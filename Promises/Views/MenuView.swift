//
//  MenuView.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit

final public class MenuView: View {
    
    private lazy var menuStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageButton, mapButton, multipleRequestButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 40.0
        return view
    }()
    
    internal let imageButton = ButtonFactory.navigationButton(title: "Image Animation")
    
    internal let mapButton = ButtonFactory.navigationButton(title: "Map View")
    
    internal let multipleRequestButton = ButtonFactory.navigationButton(title: "Multiple Requests")
    
    override public func setupLayout() {
        addSubview(menuStackView)

        let layoutBuilder = LayoutBuilder()
        layoutBuilder.center(menuStackView, in: self)
        
        NSLayoutConstraint.activate([
            menuStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7),
            menuStackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4)
        ])
    }
    
    override public func setupProperties() {
        backgroundColor = .white
    }
}
