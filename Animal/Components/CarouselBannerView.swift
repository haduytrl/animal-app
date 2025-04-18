//
//  BannerView.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import SwiftUI
import Foundation

public struct CarouselBannerView: View {
    // MARK: Properties
    
    let banners: [BannerModel]

    // MARK: Body
    
    public var body: some View {
        TabView {
            ForEach(banners, id: \.self) { item in
                Image(item.icon)
                    .resizable()
                    .scaledToFill()
            } //: ForEach
        } //: Tab
        .tabViewStyle(.automatic)
    }
}

public extension CarouselBannerView {
    struct Config: Hashable {
        private let id: String = UUID().uuidString
        let image: String
    }
}

#Preview {
    typealias File = LocalFileJSON<[BannerModel]>
    
    let banners = File.banners.loadDTO()
    
    return CarouselBannerView(banners: banners)
        .frame(height: 300)
}
