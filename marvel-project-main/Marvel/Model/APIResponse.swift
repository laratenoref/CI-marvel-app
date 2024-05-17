//
//  ModelAPI.swift
//  Marvel
//
//  Created by Clara Muniz on 10/10/23.
//

import SwiftUI

struct APIResult: Codable {
    var data: APICharactersData
}

struct APICharactersData: Codable {
    var count: Int
    var total: Int
    var results: [Character]
}

struct Character: Identifiable, Codable, Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name
    }
    
    var id: Int
    var name: String
    var description: String? = "N/D"
    var thumbnail: CharacterImage?
    var urls: [[String: String]]
}

struct CharacterImage: Codable {
    var path: String? = "N/D"
    var ext: String? = "N/D"
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext  = "extension"
    }
}

extension CharacterImage {
    var extractImage: URL? {
        let path = path ?? ""
        let ext = ext ?? ""
        return URL(string: "\(path).\(ext)")
    }
}
