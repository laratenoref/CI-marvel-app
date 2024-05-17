//
//  PersistenceData.swift
//  Marvel
//
//  Created by Clara Muniz on 23/11/23.
//

import Foundation
import SwiftData

@Model
final class CharacterFavorite {
    var id: Int
    var name: String
    var descriptionFavorite: String? = "N/D"
    var thumbnail: CharacterImageFavorites?
    var urls: [[String: String]]
    
    init(id: Int, name: String, descriptionFavorite: String?, urls: [[String: String]], thumbnail: CharacterImageFavorites) {
        self.id = id
        self.name = name
        self.descriptionFavorite = descriptionFavorite
        self.urls = urls
        self.thumbnail = thumbnail
    }
}

extension CharacterFavorite {
    func convertToCharacter() -> Character {
        Character(id: self.id,
                  name: self.name,
                  description: self.descriptionFavorite,
                  thumbnail: CharacterImage(path: self.thumbnail?.path,
                                            ext: self.thumbnail?.ext),
                  urls: self.urls)
    }
}

@Model
final class CharacterImageFavorites {
    var path: String? = "N/D"
    var ext: String? = "N/D"
    var characterFavorite: CharacterFavorite?
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext  = "extension"
    }
    
    init(path: String, ext: String) {
        self.path = path
        self.ext = ext
    }
}

extension CharacterImageFavorites {
    var extractImage: URL? {
        let path = path ?? ""
        let ext = ext ?? ""
        return URL(string: "\(path).\(ext)")
    }
}
