//
//  ViewModel.swift
//  Marvel
//
//  Created by Clara Muniz on 10/10/23.
//

import SwiftUI
import Combine

@MainActor
class DiscoverViewModel: ObservableObject {
    @Published var someCharacters: [Character] = []
    @Published var state = ViewStateDiscover.started
    
    private let marvelAPI: ServiceProtocol
    var characterContainer = APICharactersData.init(count: 50, total: 50, results: [])
    
    @Published var shouldLoadMoreCharacters = true
    
    init(marvelAPI: ServiceProtocol = Service()) {
        self.marvelAPI = marvelAPI
    }
}

extension DiscoverViewModel {
    private func fetchCharacters(nameStartsWith: String = "", sorting: Bool = true) async throws {
        let characters = try await marvelAPI.fetchingCharacters(
            offset: someCharacters.count,
            nameStartsWith: nameStartsWith,
            isSorting: sorting, 
            limit: searchLimit(nameStartsWith)
        )
        
        self.someCharacters.append(contentsOf: characters)
    }
    
    func loadInitialCharacters(nameStartsWith: String = "", sorting: Bool = true) async {
        do {
            someCharacters.removeAll()
            state = .isLoading
            try await fetchCharacters(nameStartsWith: nameStartsWith, sorting: sorting)
            state = someCharacters.isEmpty ? .requestFailed : .requestSucceeded
        } catch {
            state = .requestFailed
        }
    }
    
    func loadMoreCharacters(nameStartsWith: String = "", sorting: Bool = true) async {
        do {
            shouldLoadMoreCharacters = false
            try await fetchCharacters(nameStartsWith: nameStartsWith, sorting: sorting)
            shouldLoadMoreCharacters = true
        } catch {
            shouldLoadMoreCharacters = true
        }
    }
    
    func searchLimit(_ nameStartsWith: String) -> Int {
        if nameStartsWith.isEmpty {
            return 20
        } else {
            return characterContainer.total
        }
    }
}

#Preview {
    ContentView()
}
