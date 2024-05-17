//
//  MockError.swift
//  Marvel_Tests
//
//  Created by Clara Muniz on 14/11/23.
//

import Foundation

enum MockError: Error {
    case mockError
    
    var localizedDescription: String {
        switch self {
            
        case .mockError:
            return "Error"
        }
    }
}
