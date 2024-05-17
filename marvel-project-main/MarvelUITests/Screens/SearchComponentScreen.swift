//
//  SearchComponent.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 12/12/23.
//

import XCTest

class SearchComponentScreen: BaseScreen {
    
    private lazy var searchButton = app.buttons["Search"]
    private lazy var closeButton = app.buttons["Close"]

    private lazy var textFields = app.textFields["SearchTextField"]
    private lazy var keyBoardReturn = app.buttons["Return"]
    private lazy var scrollViewsQuery = app.scrollViews
        
    private lazy var marvelLogo = app.images["marvel_logo"]
    
    func findCharacter(_ character: String) {
        searchButton.tap()
        
        if textFields.waitForExistence(timeout: timeOut5Seconds) {
            textFields.tap()
            
            textFields.typeText(character)
            keyBoardReturn.tap()
            
            let heroCell = scrollViewsQuery.otherElements.buttons[character]
            
            XCTAssert(heroCell.waitForExistence(timeout: timeOut5Seconds))
        }
    }
    
    func doNotFindCharacter(_ character: String) {
        searchButton.tap()
        
        if textFields.waitForExistence(timeout: timeOut5Seconds) {
            textFields.tap()
            
            textFields.typeText(character)
            keyBoardReturn.tap()
            
            let heroCell = scrollViewsQuery.otherElements.buttons[character]
            
            XCTAssertFalse(heroCell.waitForExistence(timeout: timeOut5Seconds))
        }
    }
    
    func closeSearch() {
        searchButton.tap()
        
        XCTAssert(closeButton.waitForExistence(timeout: timeOut5Seconds))
        
        closeButton.tap()
        
        XCTAssertTrue(marvelLogo.waitForExistence(timeout: timeOut5Seconds))
    }
}
