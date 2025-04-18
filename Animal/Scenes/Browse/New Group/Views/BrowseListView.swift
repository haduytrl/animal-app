//
//  BrowseListView.swift
//  Animal
//
//  Created by Duy Ha on 27/10/24.
//

import SwiftUI

struct BrowseListView: View {
    // MARK: Properties
    
    let input: Input
    
    // MARK: Body
    var body: some View {
        List {
            // - Carousel banners
            Section {
                CarouselBannerView(banners: input.banners)
                    .frame(height: .screenHeight * 0.35)
            }
            .listRowInsets(.init(all: .zero))
            .listRowSeparator(.hidden)
            
            // - Animal List
            Section {
                ForEach(input.animals, id: \.self) {
                    makeAnimalContentCellWithAction($0)
                }
            }
            .listRowSeparator(.hidden)
            .listRowInsets(.init(
                top: .getSpacing(.xmedium) - 2,
                leading: horizontalPadding,
                bottom: .getSpacing(.xmedium) - 2,
                trailing: horizontalPadding))
            
            // - Spacer
            Spacer(minLength: .getSpacing(.e1Large))
                .listRowSeparator(.hidden)
        } //: List
        .listStyle(.plain)
    }
}

// MARK: - Making ViewBuilder

private extension BrowseListView {
    @ViewBuilder
    func makeAnimalContentCellWithAction(_ item: AnimalModel) -> some View {
        NavigationLink(destination: BrowseAnimalDetailScreen(detail: item)) {
            AnimalContentCell(item: item)
        }
    }
    
}

// MARK: - Models

extension BrowseListView {
    struct Input {
        let banners: [BannerModel]
        let animals: [AnimalModel]
        
        init(banners: [BannerModel] = [], animals: [AnimalModel] = []) {
            self.banners = banners
            self.animals = animals
        }
    }
}

#Preview {
    typealias BannerFiles = LocalFileJSON<[BannerModel]>
    typealias AnimalFiles = LocalFileJSON<[AnimalModel]>
    
    let banners = BannerFiles.banners.loadDTO()
    let animals = AnimalFiles.animals.loadDTO()
    
    return BrowseListView(input: .init(banners: banners, animals: animals))
}
