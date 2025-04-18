//
//  LocalFile.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation

public enum LocalFileJSON<T: Decodable>: String {
    case animals = "animals.json"
    case banners = "covers.json"
    case locations = "locations.json"
    case videos = "videos.json"

    func loadDTO() -> T {
        guard let url = Bundle.main.url(forResource: self.rawValue, withExtension: nil),
              let data = try? Data(contentsOf: url) else {
            fatalError("Loaded data failed")
        }

        return data.decode(T.self)
    }
}
