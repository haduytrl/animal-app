//
//  WebLinkingView.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import SwiftUI

public struct WebLinkingView: View {
    // MARK: - PROPERTIES
    
    let input: Input
    
    // MARK: - BODY
    
    public var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text(input.name)
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(
                        input.linkName,
                        destination: input.url ?? URL(string: "https://wikipedia.org")!
                    )
                }
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: BOX
    }
}

public extension WebLinkingView {
    struct Input {
        let name: String
        let linkName: String
        let url: URL?
        
        public init(name: String, linkName: String, link: String) {
            self.name = name
            self.linkName = linkName
            self.url = URL(string: link)
        }
    }
}

#Preview {
    typealias File = LocalFileJSON<[AnimalModel]>
    
    let item = File.animals.loadDTO()[0]
    
    return WebLinkingView(input: .init(
        name: "Wikipedia", linkName: item.name, link: item.link))
    .padding(.horizontal)
}
