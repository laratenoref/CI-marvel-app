//
//  StorageProtocol.swift
//  Marvel
//
//  Created by Clara Muniz on 06/12/23.
//

import SwiftUI
import SwiftData

protocol StorageProtocol {
    func isFavorite(_ character: Character, modelContext: ModelContext) -> Bool 
    func updateFavoritesList(_ character: Character, using modelContext: ModelContext)
}
