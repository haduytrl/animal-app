//
//  MapView.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI
import MapKit

public struct MapMinorView: View {
    // MARK: Properties
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 14.0583, longitude: 108.2772),
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
    )
    
    let destinationView: AnyView?
    
    // MARK: Initialize
    
    public init(destinationView: (any View)? = nil) {
        self.destinationView = {
            guard let destination = destinationView else { return nil }
            return AnyView(destination)
        }()
    }
    
    // MARK: Body
    
    public var body: some View {
        LegacyMapView(coordinateRegion: $region)
            .overlay(makeRoutingButton(), alignment: .topTrailing)
            .clipShape(RoundedRectangle(cornerRadius: .getCornerRadius(.small)))
            .ignoresSafeArea()
    }
}

private extension MapMinorView {
    @ViewBuilder
    func makeRoutingButton() -> some View {
        NavigationLink(destination: destinationView) {
            HStack {
                Image(systemName: "mappin.circle")
                    .foregroundStyle(.accent)
                    .imageScale(.large)
                
                Text("Locations")
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
                
            } //: HStack
            .padding(.vertical, .getSpacing(.small))
            .padding(.horizontal, .getSpacing(.xmedium) + 2)
            .background(.black.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: .getCornerRadius(.xsmall)))
        } //: Navigation
        .padding(.all, .getSpacing(.xmedium))
    }
}

#Preview {
    MapMinorView(destinationView: MapMainScreen())
        .padding(.top)
}
