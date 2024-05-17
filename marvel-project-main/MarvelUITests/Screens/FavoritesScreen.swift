//
//  FavoritesScreen.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 11/12/23.
//

import XCTest

class FavoritesScreen: BaseScreen {
    private lazy var placeHolderText = app.staticTexts["No favorites saved!"]
    
    func emptyView() {
        let emptyStateText = "No favorites saved!"
        
        XCTAssertEqual(placeHolderText.label, emptyStateText)
    }
}
