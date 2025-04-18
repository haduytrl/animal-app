//
//  VideoModel.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation

public struct VideoModel: Decodable, Hashable {
    private let uid: String = UUID().uuidString
    public let id: String
    public let name: String
    public let headline: String
    
    public var thumbnail: String { "video-" + id }
}
