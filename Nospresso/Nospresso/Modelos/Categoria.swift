//
//  Capsula.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 13/10/20.
//

import Foundation

public struct Categoria: Decodable {
    let categoria: String
    let cafes: [Cafe]
}
