//
//  DiscoverScreen.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 11/12/23.
//

import XCTest

class DiscoverScreen: BaseScreen {
    
    private lazy var sortingButton = app.buttons["Change"]
    private lazy var scrollViewsQuery = app.scrollViews
    
    func toggleSorting(_ arrow: SortingState) {
        let arrowImage = app.images[arrow.sortingButton]
        
        sortingButton.tap()
        
        XCTAssertTrue(arrowImage.waitForExistence(timeout: timeOut5Seconds))
    }
    
    func setFavorite(character: String, _ favoriteState: FavoriteState) {
        let cellTap = scrollViewsQuery.otherElements.buttons[character]
        
        cellTap.buttons[favoriteState.discoverButton].tap()
        
        XCTAssertFalse(app.images[favoriteState.discoverButton].exists)
    }
    
    func scrollUntilProgressView() {
        scrollViewsQuery.firstMatch.swipeUp()
        scrollViewsQuery.firstMatch.swipeUp()
        scrollViewsQuery.firstMatch.swipeUp()
        scrollViewsQuery.firstMatch.swipeUp()
    }
}
