//
//  ServiceProtocol.swift
//  Marvel
//
//  Created by Clara Muniz on 30/10/23.
//

import Foundation

protocol ServiceProtocol {
    func fetchingCharacters(offset: Int, nameStartsWith: String, isSorting: Bool, limit: Int) async throws -> [Character]
}
