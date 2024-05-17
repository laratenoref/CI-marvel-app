//
//  ServiceSwiftData.swift
//  Marvel
//
//  Created by Clara Muniz on 30/11/23.
//

import SwiftUI
import SwiftData
struct Storage: StorageProtocol {
    func isFavorite(_ character: Character, modelContext: ModelContext) -> Bool {
       guard let fetch = fetchCharacter(character.id, using: modelContext) else { return false }

       if fetch.id == character.id {
           return true
       } else {
           return false
       }
   }
   
    func updateFavoritesList(_ character: Character, using modelContext: ModelContext) {
       let fetch = fetchCharacter(character.id, using: modelContext)
       
       if let fetch {
           removeCharacter(fetch, using: modelContext)
       } else {
           addCharacter(character, using: modelContext)
       }
   }
}

// MARK: - Helpers for SwiftData Storage
extension Storage {
     private func addCharacter(_ character: Character, using modelContext: ModelContext) {
       let characterMarvelImage = CharacterImageFavorites(
           path: character.thumbnail?.path ?? "",
           ext: character.thumbnail?.ext ?? "")
       
       let characterMarvel = CharacterFavorite(
           id: character.id,
           name: character.name,
           descriptionFavorite: character.description,
           urls: character.urls,
           thumbnail: characterMarvelImage
       )
       
       modelContext.insert(characterMarvel)
   }
   
    private func removeCharacter(_ characterFavorite: CharacterFavorite, using modelContext: ModelContext) {
       modelContext.delete(characterFavorite)
   }
   
    private func fetchCharacter(_ id: Int, using modelContext: ModelContext) -> CharacterFavorite? {
       let descriptor = FetchDescriptor<CharacterFavorite>()
       
       guard let filteredList: [CharacterFavorite] = try? modelContext.fetch(descriptor) else { return nil }
       
       return filteredList.first(where: {$0.id == id})
   }
}
