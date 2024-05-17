//
//  FixedVariables.swift
//  Marvel
//
//  Created by Clara Muniz on 30/10/23.
//

import CryptoKit
import SwiftUI

let ts = String(Date().timeIntervalSince1970)
let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
let restfulStartPoint = "https://gateway.marvel.com:443/v1/public/characters?"

func MD5(data: String?) -> String {
    let hash = Insecure.MD5.hash(data: data?.data(using: .utf8) ?? Data())
    return hash.map{
        String(format: "%02hhx", $0)
    }
    .joined()
}

