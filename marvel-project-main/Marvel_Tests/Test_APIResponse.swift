//
//  APIResponse.swift
//  Marvel_Tests
//
//  Created by Clara Muniz on 10/11/23.
//

import XCTest
@testable import Marvel

final class test_APIResponse: XCTestCase {    
    func test_character_equatable() throws {
        let ironMan = Character(id: 1, 
                                name: "Iron Man",
                                description: "Marvel's Batman",
                                thumbnail: CharacterImage(path: "test", ext: "jpg"),
                                urls: [])
        
        let mercurio = Character(id: 1, 
                                 name: "Mercurio",
                                 description: "Marvel's Flash",
                                 thumbnail: CharacterImage(path: "test", ext: "jpg"),
                                 urls: [])
        
        XCTAssertNotEqual(ironMan, mercurio)
    }
    
    func test_description_nil() {
        let deadpool = Character(id: 1,
                                 name: "Deadpool",
                                 thumbnail: CharacterImage(path: "deadpool", ext: "jpg"), 
                                 urls: [])
        
        XCTAssertEqual(deadpool.description, "N/D")
    }
        
    func test_extractImage_URL() throws {
        var characterImage = CharacterImage()
        
        characterImage.path = "example"
        characterImage.ext = "jpg"
        
        let expectedURL = URL(string: "example.jpg")
        
        if let extractImage = characterImage.extractImage, let expectedURL = expectedURL {
            XCTAssertEqual(extractImage.absoluteString, expectedURL.absoluteString)
        } else {
            XCTFail()
        }
    }
    
    func test_extractImage_optional() throws {
        var characterImage = CharacterImage()
        
        characterImage.path = nil
        characterImage.ext = nil
        
        let expectedURL = URL(string: ".")
        
        if let extractImage = characterImage.extractImage, let expectedURL = expectedURL {
            XCTAssertEqual(extractImage.absoluteString, expectedURL.absoluteString)
        } else {
            XCTFail()
        }
    }
}
