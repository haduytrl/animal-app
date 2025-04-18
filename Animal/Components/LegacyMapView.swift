//
//  LegacyMapView.swift
//  Animal
//
//  Created by Duy Ha on 22/10/24.
//

import SwiftUI
import MapKit
import UIKit

public struct LegacyMapView: UIViewRepresentable {
    public typealias UIViewType = MKMapView
    
    // MARK: - Properties
    
    @Binding var coordinateRegion: MKCoordinateRegion
    private let mapType: MKMapType
    private let locations: [ParkLocation]
    
    // MARK: - Initialize
    
    public init(
        coordinateRegion: Binding<MKCoordinateRegion>,
        mapType: MKMapType = .standard,
        locations: [ParkLocation] = []
    ) {
        self._coordinateRegion = coordinateRegion
        self.mapType = mapType
        self.locations = locations
    }
    
    // MARK: Protocol
    
    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.mapType = mapType
        
        // Add annotations
        if !locations.isEmpty {
            locations.forEach {
                let annotation = CustomAnnotation(
                    coordinate: $0.location,
                    title: $0.name,
                    id: $0.id)
                mapView.addAnnotation(annotation)
            }
        }
        
        return mapView
    }
    
    public func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(coordinateRegion, animated: true)
        uiView.mapType = mapType
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject, MKMapViewDelegate {
        var parent: LegacyMapView
        
        init(_ parent: LegacyMapView) {
            self.parent = parent
        }
        
        // Add custom annotation view
        
        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
        -> MKAnnotationView? {
            guard let customAnnotation = annotation as? CustomAnnotation 
            else { return nil }
            
            let identifier = "CustomAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
                if let location = parent.locations.first(where: { $0.id == customAnnotation.id }) {
                    let swiftUIView = MapPinAnnotationView(location: location)
                    let controller = UIHostingController(rootView: swiftUIView)
                    
                    // Add SwiftUI view to annotation
                    annotationView?.addSubview(controller.view)
                }
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        // Observer/Update binding when region changes

        public func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.coordinateRegion = mapView.region
        }
    }
}


fileprivate class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var id: String

    init(coordinate: CLLocationCoordinate2D, title: String?, id: String) {
        self.coordinate = coordinate
        self.title = title
        self.id = id
    }
}

#Preview {
    typealias LocationFile = LocalFileJSON<[ParkLocation]>
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    )
    let data = LocationFile.locations.loadDTO()
    
    return LegacyMapView(coordinateRegion: $region, locations: data)
}
