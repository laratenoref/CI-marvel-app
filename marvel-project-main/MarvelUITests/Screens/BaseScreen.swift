//
//  OpenCell.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 12/12/23.
//

import XCTest

class BaseScreen {
    let app = XCUIApplication()
    
    private lazy var sortingButton = app.buttons["Change"]
    private lazy var scrollViewsQuery = app.scrollViews.otherElements
    
    private lazy var discoverButton = app.tabBars["Tab Bar"].buttons["Discover"]
    private lazy var favoritesButton = app.tabBars["Tab Bar"].buttons["Favorites"]
    
    lazy var searchComponent = SearchComponentScreen()
    lazy var discoverScreen = DiscoverScreen()
    lazy var favoritesScreen = FavoritesScreen()
    lazy var detaislScreen = DetailsScreen()
        
    let timeOut5Seconds: TimeInterval = 5
    
    func tapCharacter(_ character: String) {
        let buttonCharacter = scrollViewsQuery.buttons[character]
        
        XCTAssert(buttonCharacter.waitForExistence(timeout: timeOut5Seconds))
        
        buttonCharacter.tap()
    }
    
    func checkExistenceOf(_ character: String) {
        let characterCell = scrollViewsQuery.buttons[character]
        
        XCTAssert(characterCell.waitForExistence(timeout: timeOut5Seconds))
    }
    
    func checkNonExistenceOf(_ character: String) {
        let characterCell = scrollViewsQuery.buttons[character]
        
        XCTAssertFalse(characterCell.waitForExistence(timeout: timeOut5Seconds))
    }
    
    func openDiscoverView() {
        discoverButton.tap()
        
        XCTAssertTrue(sortingButton.waitForExistence(timeout: timeOut5Seconds))
    }
    
    func openFavoritesView() {
        favoritesButton.tap()
        
        XCTAssertFalse(sortingButton.waitForExistence(timeout: timeOut5Seconds))
    }
}
