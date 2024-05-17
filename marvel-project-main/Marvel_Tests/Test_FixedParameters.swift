//
//  Test_Service.swift
//  Marvel_Tests
//
//  Created by Clara Muniz on 10/11/23.
//

import XCTest
import CryptoKit

@testable import Marvel

final class Test_FixedParameters: XCTestCase {
    func test_MD5() {
        let expectedHash = "d41d8cd98f00b204e9800998ecf8427e"
        
        let hash = MD5(data: nil)
        
        XCTAssertEqual(hash, expectedHash)
    }
}





