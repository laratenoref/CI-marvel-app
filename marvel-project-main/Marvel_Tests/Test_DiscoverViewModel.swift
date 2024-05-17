//
//  DiscoverViewModel.swift
//  Marvel_Tests
//
//  Created by Clara Muniz on 09/11/23.
//

import XCTest
@testable import Marvel

//Here we have to add @MainActor because our DiscoverViewModel is executing in the main dispatch queue
@MainActor
final class test_DiscoverViewModel: XCTestCase {
    var discoverViewModel: DiscoverViewModel!
    
    //These two are needed to start our func with a new discovreViewModel
    override func setUp() {
        discoverViewModel = DiscoverViewModel()
    }
    
    override func tearDown() {
        discoverViewModel = nil
    }
    
    func test_someCharacteres_startsEmpty() throws {
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
    }
    
    func test_isLoadingMoreCharacters_shouldBeTrue() throws {
        XCTAssert(discoverViewModel.shouldLoadMoreCharacters)
    }
    
    func test_loadInitialCharacters_requestSucceeded() async {
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        await discoverViewModel.loadInitialCharacters()
        
        XCTAssertFalse(discoverViewModel.someCharacters.isEmpty)
        XCTAssertEqual(discoverViewModel.state, .requestSucceeded)
    }
    
    func test_loadInitialCharacters_requestFailed() async throws {
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        discoverViewModel = DiscoverViewModel(marvelAPI: MockService(serviceState: .fail))
        
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        await discoverViewModel.loadInitialCharacters()
        
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        XCTAssertEqual(discoverViewModel.state, .requestFailed)
    }
    
    func test_loadInitialCharacters_emptyState() async throws {
        discoverViewModel = DiscoverViewModel(marvelAPI: MockService(serviceState: .empty))
        
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        await discoverViewModel.loadInitialCharacters()
        
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        XCTAssertEqual(discoverViewModel.state, .requestFailed)
    }
    
    func test_loadMoreCharacters_isLoadingMoreCharactersSuccess() async {
        XCTAssert(discoverViewModel.shouldLoadMoreCharacters)
        
        await discoverViewModel.loadMoreCharacters()
        
        XCTAssert(discoverViewModel.shouldLoadMoreCharacters)
    }
    
    func test_loadMoreCharacters_isLoadingMoreCharactersFail() async {
        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)

        discoverViewModel = DiscoverViewModel(marvelAPI: MockService(serviceState: .fail))
        await discoverViewModel.loadMoreCharacters()

        XCTAssertTrue(discoverViewModel.someCharacters.isEmpty)
        XCTAssert(discoverViewModel.shouldLoadMoreCharacters)
    }
}
