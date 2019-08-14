//
//  MapVC.swift
//  smrtBx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: BaseVC {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gmapSetup()
    }
    
    func gmapSetup() {
        
        let lat = Double(self.viewModel.dataModel.latitude)!
        let lon = Double(self.viewModel.dataModel.longitude)!
        
        let camera = GMSCameraPosition.camera(withLatitude: lat,
                                              longitude: lon,
                                              zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = .normal
        
        let mapInsets = UIEdgeInsets(top: 80.0, left: 0.0, bottom: 45.0, right: 0.0)
        mapView.padding = mapInsets
        
        mapView.delegate = self
        
        let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat,
                                                                longitude: lon))
        marker.icon = UIImage(named: "location-pin")
        marker.map = mapView
        
        self.view = mapView
    }
}

extension MapVC: GMSMapViewDelegate {
    
}
