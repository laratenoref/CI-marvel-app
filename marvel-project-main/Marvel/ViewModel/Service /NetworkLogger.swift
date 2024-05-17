//
//  NetworkLogger.swift
//  Marvel
//
//  Created by Clara Muniz on 22/12/23.
//

import Foundation

struct NetworkLogger {
    static func log(url: String, response: HTTPURLResponse, characters: APIResult) {
        print("==============================================")
        logURL(url: url)
        print("")
        logNumber(httpResponse: response)
        print("")
        logDecode(characters: characters)
    }
    
    static func error(url: String, response: HTTPURLResponse, isDecodeError: Bool) {
        print("==============================================")
        logURL(url: url)
        print("")
        logNumber(httpResponse: response, isDecodeError: isDecodeError)
    }
}

// MARK: - Helpers
extension NetworkLogger {
    static func logURL(url: String) {
        print("⚪️ REQUEST: \(url)")
    }
    
    static func logNumber(httpResponse: HTTPURLResponse, isDecodeError: Bool = false) {
        var icon = "🔴"
        var alert: String
        
        switch httpResponse.statusCode {
        case 200..<300:
            icon = isDecodeError ? "🔴" : "🟢"
            alert = isDecodeError ?  "Failed to decode" : "Success"
        case 400..<500:
            alert = "Failed to connect with API"
        default:
            alert = "Unknown error"
        }
        
        print(icon + " RESPONSE: \(httpResponse.statusCode)", "\n")
        print(alert)
    }
    
    static func logDecode(characters: APIResult) {
        print("DATA RESPONSE: \(characters.data.results.count)")
    }
    
}
