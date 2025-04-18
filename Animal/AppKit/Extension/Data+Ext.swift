//
//  Data+Ext.swift
//  Animal
//
//  Created by Duy Ha on 20/10/24.
//

import Foundation

extension Data {
    func decode<T>(_ type: T.Type) -> T where T: Decodable {
        guard let decoded = try? JSONDecoder().decode(type, from: self) else {
            fatalError("Decoding failed")
        }
        return decoded
    }
}
