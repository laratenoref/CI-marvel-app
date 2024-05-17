//
//  SortingState.swift
//  MarvelUITests
//
//  Created by Clara Muniz on 15/12/23.
//

import Foundation

enum SortingState {
    case forward
    case reverse
    
    var sortingButton: String {
        switch self {
        case .reverse: return "Up"
        case .forward: return "Down"
        }
    }
}
