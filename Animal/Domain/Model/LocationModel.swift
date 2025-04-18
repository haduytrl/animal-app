//
//  LocationModel.swift
//  Animal
//
//  Created by Duy Ha on 21/10/24.
//

import Foundation
import MapKit

public struct ParkLocation: Decodable, Identifiable, Hashable {
    private let uid: String = UUID().uuidString
    public let id: String
    public let name: String
    public let image: String
    public let latitude: Double
    public let longitude: Double
    
    public var location: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
