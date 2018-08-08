//
//  MapView.swift
//  Promises
//
//  Created by Michał Warchał on 08.08.2018.
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit
import MapKit

final class MapContainerView: View {
    
    internal let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    internal let imageButton = ButtonFactory.navigationButton(title: "Image Animation")
    
    override func layoutSubviews() {
        addSubview(mapView)
        
        let layoutBuilder = LayoutBuilder()
        layoutBuilder.pin(mapView, to: self)
        
//        NSLayoutConstraint.activate([
//            menuStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7),
//            menuStackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4)
//        ])
    }
}
