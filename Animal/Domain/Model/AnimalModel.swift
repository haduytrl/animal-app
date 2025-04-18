//
//  AnimalModel.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation

struct AnimalModel: Decodable, Hashable {
    private let uid: String = UUID().uuidString
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
