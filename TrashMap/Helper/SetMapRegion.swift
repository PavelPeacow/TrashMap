//
//  SetMapRegion.swift
//  TrashMap
//
//  Created by Павел Кай on 27.04.2023.
//

import MapKit

extension MKMapView {
    
    func setDefaultRegion() {
        let coordinate = CLLocationCoordinate2D(latitude: 57.148470, longitude: 65.549138)
        let span = MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
        setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: true)
    }
    
}
