//
//  View+Ext.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation
import SwiftUI

public extension View {
    var horizontalPadding: CGFloat {
        return .getSpacing(.mediumLarge)
    }
    
    var itemVSpacing: CGFloat {
        return .getSpacing(.medium)
    }
    
    func safeAreaInset(_ edge: Edge.Set) -> some View {
        self.modifier(SafeAreaPaddingModifier(edge: edge))
    }
}

fileprivate struct SafeAreaPaddingModifier: ViewModifier {
    let edge: Edge.Set
    
    func body(content: Content) -> some View {
        // Apply padding based on the specified edges
        
        if edge.contains(.top) {
            content.padding(.top, .safeAreaEdgeInsets.top)
        }
        if edge.contains(.bottom) {
            content.padding(.bottom, .safeAreaEdgeInsets.bottom)
        }
        if edge.contains(.leading) {
            content.padding(.leading, .safeAreaEdgeInsets.leading)
        }
        if edge.contains(.trailing) {
            content.padding(.trailing, .safeAreaEdgeInsets.trailing)
        }
        if edge.contains(.vertical) {
            content.padding(.top, .safeAreaEdgeInsets.top)
                   .padding(.bottom, .safeAreaEdgeInsets.bottom)
        }
        if edge.contains(.horizontal) {
            content.padding(.leading, .safeAreaEdgeInsets.leading)
                   .padding(.trailing, .safeAreaEdgeInsets.trailing)
        }
        if edge.contains(.all) {
            content.padding(.top, .safeAreaEdgeInsets.top)
                   .padding(.bottom, .safeAreaEdgeInsets.bottom)
                   .padding(.leading, .safeAreaEdgeInsets.leading)
                   .padding(.trailing, .safeAreaEdgeInsets.trailing)
        }
    }
}
