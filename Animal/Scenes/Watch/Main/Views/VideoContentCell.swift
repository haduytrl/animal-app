//
//  VideoContentCell.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

struct VideoContentCell: View {
    // MARK: Properties
    
    let item: VideoModel

    // MARK: Body
    
    var body: some View {
        HStack(spacing: .getSpacing(.small)) {
            ZStack {
                Image(item.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: .sizing(.xHuge))
                    .clipShape(RoundedRectangle(cornerRadius: .getCornerRadius(.xsmall)))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(height: .buttonHeight(.small) - .sizer(.xs))
                    .shadow(radius: .sizer(.xs))
            } //: ZStack
            
            VStack(alignment: .leading, spacing: .getSpacing(.small)) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .foregroundStyle(.accent)
                
                Text(item.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .foregroundStyle(.characterDefault)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, .getSpacing(.small))
            } //: VStack
            
            Spacer()
        } //: HStack
    }
}

#Preview {
    typealias VideoFile = LocalFileJSON<[VideoModel]>
    let item = VideoFile.videos.loadDTO()[0]
    
    return VideoContentCell(item: item)
        .padding()
}
