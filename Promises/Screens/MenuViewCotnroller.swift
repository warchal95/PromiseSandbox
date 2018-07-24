//
//  MenuViewCotnroller.swift
//  PromiseToPromise
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit

final class MenunViewController: UIViewController {
    
    private let menuView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCallbacks()
    }
    
    private func setupView() {
        view.addSubview(menuView)
        LayoutBuilder().pin(menuView, to: view, edges: .init(top: 200, left: 80, bottom: -200, right: -80))
        title = "Promise to Promise"
    }

    private func setupCallbacks() {
        menuView.imageButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
    }
    
    @objc func imageButtonTapped() {
        navigationController?.pushViewController(ImageFetchViewController(), animated: true)
    }
}
