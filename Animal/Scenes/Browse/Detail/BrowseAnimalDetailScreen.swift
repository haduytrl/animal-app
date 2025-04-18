//
//  AnimalDetailScreen.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

struct BrowseAnimalDetailScreen: View {
    // MARK: Properties
    
    let detail: AnimalModel
    
    private let mapHeight: CGFloat = .screenHeight / 3.5
    
    // MARK: Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: horizontalPadding) {
                // - Banner
                Image(detail.image)
                    .resizable()
                    .scaledToFit()
                
                // - Title
                Text(detail.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .padding(.vertical, .getSpacing(.small))
                    .foregroundStyle(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: .getSpacing(.xssmall))
                            .offset(y: .getSpacing(.xlarge))
                    )
                
                // - Headline
                Text(detail.headline)
                    .font(.system(.headline))
                    .foregroundStyle(.accent)
                    .padding(.horizontal, horizontalPadding)
                
                // - Gallery
                Group {
                    IconWithTitleHorizontalView(config: .init(
                        systemIcon: "photo.on.rectangle.angled",
                        text: "Wilderness in Pictures"
                    ))
                    .padding(.vertical, itemVSpacing)
                    .padding(.horizontal, horizontalPadding)
                    
                    HorizontalGalleryView(input: .init(images: detail.gallery))
                }
                
                // - Facts
                Group {
                    IconWithTitleHorizontalView(config: .init(
                        systemIcon: "questionmark.circle",
                        text: "Did you know ?"
                    ))
                    .padding(.vertical, itemVSpacing)
                    
                    CarouselCardTextView(config: .init(contents: detail.fact))
                }
                .padding(.horizontal, horizontalPadding)
                
                // - Description
                Group {
                    IconWithTitleHorizontalView(config: .init(
                        systemIcon: "info.circle",
                        text: "All about \(detail.name)"
                    ))
                    .padding(.vertical, itemVSpacing)
                    
                    Text(detail.description)
                        .layoutPriority(1.0)
                }
                .padding(.horizontal, horizontalPadding)
                
                // - Map
                Group {
                    IconWithTitleHorizontalView(config: .init(
                        systemIcon: "map",
                        text: "Location"
                    ))
                    .padding(.vertical, itemVSpacing)
                    
                    MapMinorView(destinationView: MapMainScreen())
                        .frame(idealHeight: mapHeight, maxHeight: 400)
                }
                .padding(.horizontal, horizontalPadding)
                
                // - Link
                Group {
                    IconWithTitleHorizontalView(config: .init(
                        systemIcon: "books.vertical",
                        text: "Research more"
                    ))
                    .padding(.vertical, itemVSpacing)
                    
                    WebLinkingView(input: .init(
                        name: "Wikipedia",
                        linkName: detail.name,
                        link: detail.link))
                }
                .padding(.horizontal, horizontalPadding)
            } //: LazyVStack
            .navigationTitle("About \(detail.name)")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.bottom, .getSpacing(.e1Large))
        } //: Scroll
    }
}

#Preview {
    typealias File = LocalFileJSON<[AnimalModel]>
    
    let list = File.animals.loadDTO()
    return BrowseAnimalDetailScreen(detail: list[0])
}
