//
//  AnimalContentCell.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

struct AnimalContentCell: View {
    // MARK: Properties
    
    private let imgSize: CGFloat = .getIconSize(.large) - .getSpacing(.xssmall)
    let item: AnimalModel
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center, spacing: itemVSpacing) {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: imgSize, height: imgSize)
                .clipShape(RoundedRectangle(cornerRadius: .getCornerRadius(.small)))
            
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
                    .padding(.trailing, .getSpacing(.small))
            }
        }
    }
}

#Preview {
    typealias File = LocalFileJSON<[AnimalModel]>
    
    let list = File.animals.loadDTO()
    return AnimalContentCell(item: list[0])
}
