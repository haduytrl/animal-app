//
//  BrowseScreen.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import SwiftUI

struct BrowseMainScreen: View {
    typealias BannerFiles = LocalFileJSON<[BannerModel]>
    typealias AnimalFiles = LocalFileJSON<[AnimalModel]>
    
    
    // MARK: Properties
    
    private let banners = BannerFiles.banners.loadDTO()
    private let animals = AnimalFiles.animals.loadDTO()
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: State
    
    @State private var displayMode: DisplayViewMode = .list
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var columnCount: Int = 1
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            Group {
                switch displayMode {
                case .list:
                    BrowseListView(
                        input: .init(banners: banners, animals: animals)
                    )
                case .grid:
                    BrowseGridView(gridLayout: $gridLayout, input: .init(animals: animals, destinationBuilder: {
                        BrowseAnimalDetailScreen(detail: $0)
                    }))
                }
   
            } //: Group
            .navigationTitle("Animal")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: itemVSpacing) {
                        makeShowListViewButton()
                        makeShowGridViewButton()
                    }
                }
            }
        } //: Navigation
    }
}

// MARK: - Configure

private extension BrowseMainScreen {
    func listViewBtnTapped() {
        guard displayMode != .list else { return }
        haptics.impactOccurred()
        displayMode = .list
    }
    
    func gridSwitchBtnTapped() {
        haptics.impactOccurred()
        displayMode = .grid
        gridLayout = Array(repeating: GridItem(.flexible()), count: columnCount % 3 + 1)
        columnCount = gridLayout.count
    }
}

// MARK: - Making ViewBuilder
private extension BrowseMainScreen {
    @ViewBuilder
    func makeShowListViewButton() -> some View {
        Button(action: listViewBtnTapped) {
            Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundStyle(displayMode == .list
                                 ? .accent
                                 : .characterDefault)
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    func makeShowGridViewButton() -> some View {
        let icon: String = {
            switch columnCount {
            case 2: "square.grid.3x2"
            case 3: "rectangle.grid.1x2"
            default: "square.grid.2x2"
            }
        }()
        
        Button(action: gridSwitchBtnTapped) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(displayMode == .grid
                                 ? .accent
                                 : .characterDefault)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BrowseMainScreen()
}
