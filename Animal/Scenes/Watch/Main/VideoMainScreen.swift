//
//  VideoListScreen.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import SwiftUI

struct VideoMainScreen: View {
    typealias VideoFile = LocalFileJSON<[VideoModel]>
    
    // MARK: Properties
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: State
    
    @State private var videos = VideoFile.videos.loadDTO()
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: itemVSpacing) {
                        ForEach(videos, id: \.self) {
                            makeVideoContentCellWithAction($0)
                        }
                    }
                    .padding(.top, .getSpacing(.small))
                    .padding(.horizontal, horizontalPadding)
                    .padding(.bottom, .getSpacing(.e1Large))
                } //: ScrollView
                .navigationTitle("Videos")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            updateVideoUI(proxy)
                        } label: {
                            Image(systemName: "arrow.2.squarepath")
                        }
                    }
                }
            } //: ScrollViewReader
        } //: Navigation
    }
}

// MARK: - Configure

private extension VideoMainScreen {
    func updateVideoUI(_ proxy: ScrollViewProxy) {
        hapticImpact.impactOccurred()
        
        guard let first = videos.first else { return }
        
        withAnimation(.smooth(duration: 0.2)) {
            proxy.scrollTo(first, anchor: .top)
        }
        
        withAnimation(.smooth(duration: 0.35)) {
            videos.shuffle()
        }
    }
}

// MARK: - Making UI

private extension VideoMainScreen {
    @ViewBuilder
    func makeVideoContentCellWithAction(_ item: VideoModel) -> some View {
        NavigationLink(destination: VideoPlayerScreen(detail: item)) {
            VideoContentCell(item: item)
        }
    }
}

#Preview {
    VideoMainScreen()
}
