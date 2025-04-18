//
//  HorizontalGalleryView.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

public struct HorizontalGalleryView: View {
    // MARK: Properties
    
    let input: Input
    
    // MARK: Body
    
    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: itemVSpacing) {
                ForEach(input.images, id: \.self) {
                    Image($0.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: input.size.width, height: input.size.height)
                        .clipShape(
                            RoundedRectangle(cornerRadius: .getCornerRadius(.small))
                        )
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
    }
}

public extension HorizontalGalleryView {
    struct Input {
        let images: [Gallery]
        let size: CGSize
        
        public init(
            images: [String],
            size: CGSize = .init(width: .screenWidth * 0.832, height: .screenHeight * 0.24)
        ) {
            self.images = images.map { Gallery(image: $0) }
            self.size = size
        }
    }
    
    struct Gallery: Hashable {
        private let uid: String = UUID().uuidString
        let image: String
    }
}


#Preview {
    typealias File = LocalFileJSON<[AnimalModel]>
    
    let list = File.animals.loadDTO()
    return HorizontalGalleryView(input: .init(images: list[0].gallery))
}
