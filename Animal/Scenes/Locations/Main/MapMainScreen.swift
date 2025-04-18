//
//  MapScreen.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import SwiftUI
import MapKit

struct MapMainScreen: View {
    typealias LocationFile = LocalFileJSON<[ParkLocation]>
    
    // MARK: Properties
    
    private let mapPinSize: CGFloat = .getIconSize(.x2small)
    private let iconCompassSize: CGFloat = .getIconSize(.medium)
    private let locations = LocationFile.locations.loadDTO()
    
    // MARK: State
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    )
    
    // MARK: Body
    
    var body: some View {
        LegacyMapView(coordinateRegion: $region, locations: locations)
            .overlay(
                HStack(alignment: .center, spacing: .getSpacing(.xmedium)) {
                    Image(.compass)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconCompassSize, height: iconCompassSize)
                    
                    VStack(alignment: .leading, spacing: .getSpacing(.small)) {
                        TitleDescHorizontalView(input: .init(
                            title: "Latitude:",
                            desc: "\(region.center.latitude)"
                        ))
                        
                        Divider().background(.gray)
                        
                        TitleDescHorizontalView(input: .init(
                            title: "Longitude:",
                            desc: "\(region.center.longitude)"
                        ))
                    } //: VStack
                } //: HStack
                    .padding(.vertical, .getSpacing(.xmedium))
                    .padding(.horizontal, itemVSpacing)
                    .background(.black.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: .getCornerRadius(.xsmall)))
                    .padding(itemVSpacing)
                    .frame(maxWidth: .iPhoneMaxWidth)
                , alignment: .top)
    }
}

#Preview {
    MapMainScreen()
}
