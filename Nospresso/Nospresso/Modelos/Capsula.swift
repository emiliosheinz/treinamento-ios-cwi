//
//  Capsula.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 13/10/20.
//

import Foundation

public struct Capsula: Decodable {
    let categoria: String
    let cafes: [CafeDaCapsula]
}
