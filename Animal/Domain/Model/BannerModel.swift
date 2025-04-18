//
//  BannerModel.swift
//  Animal
//
//  Created by Duy Ha on 19/10/24.
//

import Foundation

struct BannerModel: Decodable, Hashable {
    private let uuid: String = UUID().uuidString
    let id: Int
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case icon = "name"
    }
}
