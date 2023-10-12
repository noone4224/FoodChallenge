//
//  MapView.swift
//  FoodChallenge
//
//  Created by Rafael on 11/10/23.
//

import SwiftUI
import Foundation
import MapKit

struct MapTabView: View {
    
    let location: LocationRecipe
    
    var body: some View {
        MapView(location: location)
    }
}

struct MapView: UIViewRepresentable {
    
    let location: LocationRecipe
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
        guard let latitude = Double(location.latitude ?? ""),
              let longitude = Double(location.longitude ?? "") else {
            return
        }
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = location.name
        annotation.subtitle = location.address
        
        view.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        view.setRegion(region, animated: true)
    }
}
