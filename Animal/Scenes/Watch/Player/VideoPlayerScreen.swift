//
//  VideoPlayerView.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI
import AVKit

public struct VideoPlayerScreen: View {
    // MARK: Properties
    
    let detail: VideoModel
    
    private let player: AVPlayer?
    private let size: CGFloat = .getIconSize(.x2small)
    
    // MARK: Initialize
    
    public init(detail: VideoModel) {
        self.detail = detail
        self.player = VideoPlayerHelper.playVideo(id: detail.id)
    }
    
    // MARK: Body
    
    public var body: some View {
        VStack {
            VideoPlayer(player: self.player)
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                    , alignment: .topLeading
                )
        } //: VSTACK
        .accentColor(.accentColor)
        .navigationTitle(detail.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    VideoPlayerScreen(detail: .init(id: "cheetah", name: "Cheetah", headline: ""))
}
