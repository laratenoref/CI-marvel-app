//
//  DetailsScreen.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 11/12/23.
//

import XCTest

class DetailsScreen: BaseScreen {
    
    private lazy var noDescription = app.staticTexts["No description available"]
    private lazy var favoriteButton = app.buttons["Favorite"]
    private lazy var exitButton = app.buttons["Left"]
    
    func emptyInformation() {
        XCTAssertTrue(noDescription.waitForExistence(timeout: timeOut5Seconds))
    }
    
    func setFavorite(_ favoriteState: FavoriteState) {
        favoriteButton.tap()
        
        XCTAssertFalse(app.images[favoriteState.detailsButton].exists)
    }
    
    func exitDetails() {
        exitButton.tap()
    }
}
