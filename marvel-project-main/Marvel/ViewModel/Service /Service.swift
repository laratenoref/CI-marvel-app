//
//  APItest.swift
//  Marvel
//
//  Created by Clara Muniz on 30/10/23.
//

import CryptoKit
import SwiftUI
import Combine

class Service: ServiceProtocol {
    func fetchingCharacters(offset: Int, nameStartsWith: String, isSorting: Bool, limit: Int) async throws -> [Character] {
        let urlString = urlString(offset: offset, nameStartsWith: nameStartsWith, isSorting: isSorting, limit: limit)
        guard let url = URL(string: urlString) else { return [] }
        
        let (data, httpResponse) = try await fetchData(from: url)
        
        do {
            let characters = try await decodeJSON(data: data)
            
            NetworkLogger.log(url: urlString, response: httpResponse, characters: characters)
            
            return characters.data.results
        } catch {
            NetworkLogger.error(url: urlString, response: httpResponse, isDecodeError: true)
            
            return []
        }
    }
}

// MARK: - Helpers
extension Service {
    private func fetchData(from url: URL) async throws -> (data: Data, response: HTTPURLResponse) {
        let session = URLSession(configuration: .default)
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
        
        return (data, httpResponse)
    }
    
    private func decodeJSON(data: Data) async throws -> APIResult {
        let characters = try JSONDecoder().decode(APIResult.self, from: data)
        
        return characters
    }
    
    private func urlString(offset: Int, nameStartsWith: String, isSorting: Bool, limit: Int) -> String {
        var parameters: [String: Any] = [
            "nameStartsWith": nameStartsWith,
            "orderBy": "-name",
            "limit": limit,
            "offset": offset,
            "ts": ts,
            "apikey": publicKey,
            "hash": hash
        ]
        
        if nameStartsWith.isEmpty {
            parameters.removeValue(forKey: "nameStartsWith")
        }
        
        if isSorting {
            parameters.removeValue(forKey: "orderBy")
        }
        
        return generateURLString(withQueryParameters: parameters)
    }
    
    private func generateURLString(withQueryParameters parameters: [String: Any]) -> String {
        var urlString = "\(restfulStartPoint)"
        
        for (key, value) in parameters {
            urlString += "\(key)=\(value)&"
        }
        
        if urlString.last == "&" {
            urlString.removeLast()
        }
        
        return urlString
    }
}
