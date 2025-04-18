//
//  TitleDetailHorizontalView.swift
//  Animal
//
//  Created by Duy Ha on 22/10/24.
//

import SwiftUI

public struct TitleDescHorizontalView: View {
    // MARK: Properties
    
    let input: Input
    
    public var body: some View {
        HStack(spacing: input.spacing) {
            Text(input.title)
                .font(input.titleFont)
                .foregroundStyle(input.titleColor)
            
            Spacer()
            
            Text(input.desc)
                .font(input.descFont)
                .foregroundStyle(input.descColor)
        }
    }
}

public extension TitleDescHorizontalView {
    struct Input {
        let titleColor: Color
        let descColor: Color
        let titleFont: Font
        let descFont: Font
        let title: String
        let desc: String
        let spacing: CGFloat
        
        public init(
            titleColor: Color = .accentColor,
            descColor: Color = .primary,
            titleFont: Font = .footnote,
            descFont: Font = .footnote,
            title: String,
            desc: String,
            spacing: CGFloat = .getSpacing(.small)
        ) {
            self.titleColor = titleColor
            self.descColor = descColor
            self.titleFont = titleFont
            self.descFont = descFont
            self.title = title
            self.desc = desc
            self.spacing = spacing
        }
    }
}

#Preview {
    TitleDescHorizontalView(input: .init(title: "Title", desc: "description"))
        .padding(.horizontal)
}
