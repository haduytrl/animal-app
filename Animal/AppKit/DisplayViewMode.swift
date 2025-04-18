//
//  DisplayViewMode.swift
//  Animal
//
//  Created by Duy Ha on 27/10/24.
//

import Foundation
import SwiftUI

public enum DisplayViewMode: Equatable {
    case list
    case grid
    
    public var icon: String {
        switch self {
        case .list:
            return "square.fill.text.grid.1x2"
        case .grid:
            return "square.fill.text.grid.1x2"
        }
    }
    
    public static var browseCases: [DisplayViewMode] = [.list, grid]
}

