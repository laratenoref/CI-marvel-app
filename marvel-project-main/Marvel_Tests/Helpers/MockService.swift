//
//  MockService.swift
//  Marvel_Tests
//
//  Created by Clara Muniz on 14/11/23.
//

import Foundation
@testable import Marvel

class MockService: ServiceProtocol {
    //This is working like a fake test for our tests
    var serviceState: ServiceState
    
    init(serviceState: ServiceState) {
        self.serviceState = serviceState
    }
    
    func fetchingCharacters(offset: Int, nameStartsWith: String, isSorting: Bool, limit: Int) async throws -> [Marvel.Character] {
        
        switch serviceState {
        case .success:
            return [Marvel.Character(id: 019230123, name: "thor teste", thumbnail: CharacterImage(path: "", ext: ""), urls: [])]
        case .fail:
            throw MockError.mockError
        case .empty:
            return []
        }
    }
}
