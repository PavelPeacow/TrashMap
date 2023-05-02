//
//  LocationManager.swift
//  TrashMap
//
//  Created by Павел Кай on 27.04.2023.
//

import CoreLocation

final class LocationManager: NSObject {
    private let manager = CLLocationManager()
    private var locationCallback: ((CLLocationCoordinate2D) -> Void)?
    
    static let shared = LocationManager()
    
    private override init() {
        super.init()
        manager.delegate = self
    }
    
    private func requestPermissions() {
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.requestLocation()
    }
    
    func requestLocation(_ callback: @escaping (CLLocationCoordinate2D) -> Void) {
        requestPermissions()
        locationCallback = callback
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        locationCallback?(location.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
