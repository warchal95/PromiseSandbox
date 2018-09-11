//
//  MKCoordinateSpanExtension.swift
//  Promises
//
//  Copyright © 2018 Michał Warchał. All rights reserved.
//

import MapKit.MKFoundation

public extension MKCoordinateSpan {
    static var defaultValue: MKCoordinateSpan {
        return MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    }
}
