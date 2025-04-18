//
//  GalleryScreen.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import SwiftUI

struct GalleryMainScreen: View {
    typealias AnimalFile = LocalFileJSON<[AnimalModel]>
    
    // MARK: Properties
    
    private let bannerSize: CGFloat = .screenHeight / 4.0
    private let animals = AnimalFile.animals.loadDTO()
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: State
    
    @State private var gridColumn: Double = 3.0
    @State private var gridLayouts = [GridItem]()
    @State private var selectedImage = String()
    
    // MARK: Body
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: .getSpacing(.large32)) {
                // Banner
                
                Image(selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        idealWidth: bannerSize,
                        maxWidth: .iPhoneMaxWidth,
                        idealHeight: bannerSize,
                        maxHeight: .iPhoneMaxWidth)
                    .clipShape(.circle)
                    .overlay(Circle().stroke(.characterDefault, lineWidth: 8.0))
                
                // Slider
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal, horizontalPadding)
                    .onChange(of: gridColumn) { _ in
                        handleGridSwitch()
                    }
                
                // Grid
                LazyVGrid(columns: gridLayouts, spacing: itemVSpacing) {
                    ForEach(animals, id: \.self) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.circle)
                            .overlay(Circle().stroke(.characterDefault, lineWidth: 1.5))
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.2)) {
                                    itemAnimalTapped(item.image)
                                }
                            }
                    } //: ForEach
                } //:LazyVGrid
                .onAppear {
                    handleGridSwitch()
                    guard let first = animals.first else { return }
                    selectedImage = first.image
                }
            } //: VStack
            .safeAreaInset(.top)
            .padding(.horizontal, .getSpacing(.xmedium))
        } //: Scrollview
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BubbleMotionBackground())
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: - Configure

private extension GalleryMainScreen {
    func itemAnimalTapped(_ image: String) {
        guard selectedImage != image else { return }
        selectedImage = image
        haptics.impactOccurred()
    }
    
    func handleGridSwitch() {
        withAnimation(.easeOut(duration: 0.4)) {
            gridLayouts = Array(repeating: .init(.flexible()), count: Int(gridColumn))
        }
    }
}

#Preview {
    GalleryMainScreen()
}
