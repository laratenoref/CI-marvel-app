//
//  FavoritesTest.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 13/12/23.
//

import XCTest

class FavoritesTest: BaseTest {
//    func test_character_shouldExistInFavorites() {
//        discoverScreen.setFavorite(character: "3-D Man", .favorite)
//        favoritesScreen.openFavoritesView()
//        favoritesScreen.checkExistenceOf("3-D Man")
//        favoritesScreen.tapCharacter("3-D Man")
//        
//        detailsScreen.emptyInformation()
//        detailsScreen.setFavorite(.unfavorite)
//        detailsScreen.setFavorite(.favorite)
//        detailsScreen.exitDetails()
//        
//        favoritesScreen.checkExistenceOf("3-D Man")
//        
//        discoverScreen.openDiscoverView()
//        favoritesScreen.checkExistenceOf("3-D Man")
//        discoverScreen.setFavorite(character: "3-D Man", .unfavorite)
//    }
    
    func test_character_shouldOpen() {
        discoverScreen.setFavorite(character: "Aaron Stack", .favorite)
        favoritesScreen.openFavoritesView()
        favoritesScreen.checkExistenceOf("Aaron Stack")
        favoritesScreen.tapCharacter("Aaron Stack")
        
        detailsScreen.emptyInformation()
        detailsScreen.exitDetails()
        
        discoverScreen.openDiscoverView()
        discoverScreen.setFavorite(character: "Aaron Stack", .unfavorite)
    }

    func test_search_shouldFind() {
        discoverScreen.setFavorite(character: "Aaron Stack", .favorite)
        favoritesScreen.openFavoritesView()
        
        searchComponent.findCharacter("Aaron Stack")
        searchComponent.checkExistenceOf("Aaron Stack")
        
        discoverScreen.openDiscoverView()
        discoverScreen.setFavorite(character: "Aaron Stack", .unfavorite)
    }
    
    func test_search_shouldNotFind() {
        favoritesScreen.openFavoritesView()
        
        searchComponent.doNotFindCharacter("Jsd")
        discoverScreen.checkNonExistenceOf("Jsd")
    }
    
//    func test_favorite_isEmpty() {
//        favoritesScreen.openFavoritesView()
//        favoritesScreen.emptyView()
//    }
}
