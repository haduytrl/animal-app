//
//  AppTabBuilder.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

public enum BottomTabBar: Hashable, Identifiable, CaseIterable {
    case browse
    case watch
    case locations
    case gallery
    
    public var id: BottomTabBar { self }
}

public extension BottomTabBar {
    @ViewBuilder
    var label: some View {
        switch self {
        case .browse:
            Label("Browse", systemImage: "square.grid.2x2")
        case .watch:
            Label("Watch", systemImage: "play.rectangle")
        case .locations:
            Label("Locations", systemImage: "map")
        case .gallery:
            Label("Gallery", systemImage: "photo")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .browse:
            BrowseMainScreen()
        case .watch:
            VideoMainScreen()
        case .locations:
            MapMainScreen()
        case .gallery:
            GalleryMainScreen()
        }
    }
}
