//
//  PinAnnotationView.swift
//  Animal
//
//  Created by Duy Ha on 22/10/24.
//

import SwiftUI

public struct MapPinAnnotationView: View {
    // MARK: Properties
    
    let location: ParkLocation
    
    private let iconSize: CGFloat = .getIconSize(.medium)
    private var circleSize: CGFloat {
        return iconSize + .getSpacing(.xssmall)
    }
    
    // MARK: State
    
    @State private var animation: Double = .zero
    
    // MARK: State
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(.accent, lineWidth: 1.5)
                .frame(width: circleSize - 2, height: circleSize - 2, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: iconSize, height: iconSize, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(.accent, lineWidth: 3.0))
            
        } //: ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2.0).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}

#Preview {
    typealias File = LocalFileJSON<[ParkLocation]>
    
    let item = File.locations.loadDTO()[0]
    return MapPinAnnotationView(location: item)
}
