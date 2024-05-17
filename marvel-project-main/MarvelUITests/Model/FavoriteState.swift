//
//  FavoriteState.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 14/12/23.
//

import Foundation

enum FavoriteState {
    case favorite
    case unfavorite
    
    var discoverButton: String {
        switch self {
        case .favorite: return "unchecked"
        case .unfavorite: return "checked"
        }
    }
    
    var detailsButton: String {
        switch self {
        case .favorite: return "star"
        case .unfavorite: return "star.fill"
        }
    }
}
