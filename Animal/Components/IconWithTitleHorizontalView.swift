//
//  HeadlineView.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

public struct IconWithTitleHorizontalView: View {
    // MARK: Properties
    
    let config: Config
    
    // MARK: Body
    
    public var body: some View {
        HStack {
            Image(systemName: config.systemIcon)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(config.text)
                .font(.title3)
                .fontWeight(.bold)
        } //: HStack
    }
}

public extension IconWithTitleHorizontalView {
    struct Config {
        let systemIcon: String
        let text: String
    }
}

#Preview {
    IconWithTitleHorizontalView(config: .init(systemIcon: "photo.on.rectangle.angled", text: "Some text of headline"))
        .padding()
}
