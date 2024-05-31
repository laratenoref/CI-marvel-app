//
//  FavoritesTest.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 12/12/23.
//

import XCTest

class DiscoverTest: BaseTest {
    func test_sorting_shouldChangeCharacters() {
        discoverScreen.toggleSorting(.reverse)
        discoverScreen.checkExistenceOf("Zzzax")
        
        discoverScreen.toggleSorting(.forward)
        discoverScreen.checkExistenceOf("3-D Man")
    }
    
    func test_scrollDown_shouldLoadMoreCharacters() {
        discoverScreen.scrollUntilProgressView()
        discoverScreen.checkExistenceOf("Ajak")
    }
    
    func test_search_shouldFind() {
        searchComponent.findCharacter("3-D Man")
        discoverScreen.checkExistenceOf("3-D Man")
    }
    
    func test_search_shouldNotFind() {
        searchComponent.doNotFindCharacter("Jsd")
        discoverScreen.checkNonExistenceOf("Jsd")
    }
    
    func test_tappedCharacter_shouldFavoriteAndUnfavorite() {
        discoverScreen.tapCharacter("3-D Man")
        
        detailsScreen.emptyInformation()
        
        detailsScreen.setFavorite(.favorite)
        detailsScreen.setFavorite(.unfavorite)
        
        detailsScreen.exitDetails()
    }
    
    func test_favoriteButton_shouldFavoriteAndUnfavorite() {
        discoverScreen.setFavorite(character: "3-D Man", .favorite)
        discoverScreen.setFavorite(character: "3-D Man", .unfavorite)
    }
}
