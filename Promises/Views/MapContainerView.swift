//
//  MapView.swift
//  Promises
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit
import MapKit.MKMapView

final public class MapContainerView: View {

    internal let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    internal let imageButton = ButtonFactory.navigationButton(title: "Image Animation")

    override public func setupLayout() {
        addSubview(mapView)
        let layoutBuilder = LayoutBuilder()
        layoutBuilder.pin(mapView, to: self)
    }
}
