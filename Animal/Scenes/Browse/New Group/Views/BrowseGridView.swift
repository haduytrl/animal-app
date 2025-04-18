//
//  BrowseGridView.swift
//  Animal
//
//  Created by Duy Ha on 27/10/24.
//

import SwiftUI

struct BrowseGridView<Destination: View>: View {
    // MARK: Binding
    
    @Binding var gridLayout: [GridItem]
    
    // MARK: Properties
    
    let input: Input
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, spacing: .getSpacing(.xmedium)) {
                ForEach(input.animals.indices, id: \.self) { index in
                    makeItemViewWithAction(input.animals[index])
                        .padding(.trailing, index % 2 == 0 ? .sizer(.sizer2Xs) : 0)
                        .padding(.leading, index % 2 != 0 ? .sizer(.sizer2Xs) : 0)
                } //: ForEach
            } //: LazyVGrid
        } //: Scroll
        .padding(.horizontal, .getSpacing(.xmedium))
        .animation(.smooth(duration: 0.35), value: gridLayout.count)
    }
}

// MARK: - Making ViewBuilder

private extension BrowseGridView {
    @ViewBuilder
    func makeItemViewWithAction(_ item: AnimalModel) -> some View {
        NavigationLink(destination: input.destinationBuilder(item)) {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: .getCornerRadius(.small)))
        }
    }
}

// MARK: - Models

extension BrowseGridView {
    struct Input {
        let animals: [AnimalModel]
        let destinationBuilder: (AnimalModel) -> Destination
        
        init(
            animals: [AnimalModel],
            destinationBuilder: @escaping (AnimalModel) -> Destination = { _ in EmptyView() }
        ) {
            self.animals = animals
            self.destinationBuilder = destinationBuilder
        }
    }
}

#Preview {
    typealias AnimalFiles = LocalFileJSON<[AnimalModel]>
    
    let animals = AnimalFiles.animals.loadDTO()
    
    @State var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    return BrowseGridView(
        gridLayout: $gridLayout,
        input: .init(animals: animals, destinationBuilder: {
            BrowseAnimalDetailScreen(detail: $0)
        })
    )
}
