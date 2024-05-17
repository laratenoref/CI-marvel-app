//
//  BaseTest.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 12/12/23.
//

import XCTest
let app = XCUIApplication()

/*
 Os testes de UI são separados em duas frentes principais: UI e fluxo. Em Screens, temos os testes que são mais focados para ver ocorre a mudança de UI e se é possível clicar em coisas e interagir com elas. Em tests, testamos se o fluxo a partir do momento que clicamos essas coisas realmente funcionam.
 */

class BaseTest: XCTestCase {
    var searchComponent = SearchComponentScreen()
    var discoverScreen = DiscoverScreen()
    var favoritesScreen = FavoritesScreen()
    var detailsScreen = DetailsScreen()
    
    override func setUpWithError() throws {
        continueAfterFailure = false

        app.launch()
        discoverScreen.checkExistenceOf("3-D Man")
    }
    
    override func tearDownWithError() throws {
    }
}
