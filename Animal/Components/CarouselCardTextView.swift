//
//  CarouselCardTextView.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

public struct CarouselCardTextView: View {
    // MARK: Properties
    
    let config: Config

    // MARK: Body
    
    public var body: some View {
        GroupBox {
            TabView {
                ForEach(config.contents, id: \.self) { item in
                    Text(item.description)
                        .lineLimit(5)
                }
            }
            .tabViewStyle(.page)
            .frame(
                minHeight: .getIconSize(.extraExtraLarge),
                idealHeight: config.maxHeight - .getSpacing(.xmedium),
                maxHeight: config.maxHeight)
        }
    }
}

// MARK: Model

public extension CarouselCardTextView {
    struct Config {
        let contents: [Content]
        let maxHeight: CGFloat
        
        init(
            contents: [String],
            maxHeight: CGFloat = .getIconSize(.extraExtraLarge) 
                                 + .getIconSize(.xsmall)
        ) {
            self.contents = contents.map { Content(description: $0) }
            self.maxHeight = maxHeight
        }
    }
    
    struct Content: Hashable {
        private let id: String = UUID().uuidString
        let description: String
    }
}

#Preview {
    typealias File = LocalFileJSON<[AnimalModel]>
    
    let animals = File.animals.loadDTO()
    
    return CarouselCardTextView(config: .init(contents: animals[0].fact))
        .padding(.horizontal)
}
