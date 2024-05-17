//
//  Test_Storage.swift
//  Marvel_Tests
//
//  Created by Clara Muniz on 04/12/23.
//

import XCTest
import SwiftData
import SwiftUI

@testable import Marvel

@MainActor
final class test_Storage: XCTestCase {
    var config: ModelConfiguration!
    var container: ModelContainer!
    
    var storage = Storage()
    
    override func setUp() {
        config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try? ModelContainer(for: CharacterFavorite.self, configurations: config)
    }
    
    let ironManCharacter = Character(id: 1,
                                     name: "Iron Man",
                                     description: "",
                                     thumbnail: CharacterImage(path: "test", ext: "jpg"),
                                     urls: [])
    
    
    func test_isFavorite_shouldBeTrue() throws {
        storage.updateFavoritesList(ironManCharacter, using: container.mainContext)
        
        XCTAssertFalse(container.mainContext.insertedModelsArray.isEmpty)
        
        let isFavorite = storage.isFavorite(ironManCharacter, modelContext: container.mainContext)
        
        XCTAssert(isFavorite)
    }
    
    func test_isFavorite_shouldBeFalse() throws {
        let isFavorite = storage.isFavorite(ironManCharacter, modelContext: container.mainContext)
        
        XCTAssertFalse(isFavorite)
    }
    
    func test_updateFavoritesList_shouldAddCharacter() throws {
        storage.updateFavoritesList(ironManCharacter, using: container.mainContext)
        
        XCTAssertFalse(container.mainContext.insertedModelsArray.isEmpty)
    }
    
    func test_updateFavoritesList_shouldRemoveCharacter() throws {
        storage.updateFavoritesList(ironManCharacter, using: container.mainContext)
        
        XCTAssertFalse(container.mainContext.insertedModelsArray.isEmpty)
        
        let expectation = XCTestExpectation(description: "Remove character after delay")
        
        Task {
            storage.updateFavoritesList(ironManCharacter, using: container.mainContext)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
        XCTAssertTrue(container.mainContext.insertedModelsArray.isEmpty)
    }
}
