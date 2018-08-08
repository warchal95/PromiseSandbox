//
//  MapViewController.swift
//  Promises
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import UIKit
import PromiseKit
import MapKit

final class MapViewController: UIViewController {
    
    private let mapContainerView = MapContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        applyCoordinates()
    }

    private func setupView() {
        view.addSubview(mapContainerView)
        LayoutBuilder().pin(mapContainerView, to: view)
    }
}

extension MapViewController {
    
    private func applyCoordinates() {
        firstly {
            getDesiredLocation()
        }.done { location in
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan.defaultValue)
            self.mapContainerView.mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            self.mapContainerView.mapView.addAnnotation(annotation)
        }.catch { (error) in
            print(error)
        }
    }
    
    private func getDesiredLocation() -> Promise<CLLocationCoordinate2D> {
        return Promise<CLLocationCoordinate2D> { seal in
            seal.fulfill(CLLocationCoordinate2D(latitude: 50.06, longitude: 20))
        }
    }
}
