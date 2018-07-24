//
//  MenuView.swift
//  PromiseToPromise
//
//

import UIKit

final class MenuView: View {
    
    private lazy var menuStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageButton, secondFuncButton, thirdFuncntionButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 40.0
        return view
    }()
    
    internal let imageButton = ButtonFactory.navigationButton(title: "Image Magic")
    
    internal let secondFuncButton = ButtonFactory.navigationButton(title: "some second button")
    
    internal let thirdFuncntionButton = ButtonFactory.navigationButton(title: "Some third button")
    
    override func layoutSubviews() {
        addSubview(menuStackView)

        let layoutBuilder = LayoutBuilder()
        layoutBuilder.center(menuStackView, in: self)
        
        NSLayoutConstraint.activate([
            menuStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7),
            menuStackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4)
        ])
    }
}
