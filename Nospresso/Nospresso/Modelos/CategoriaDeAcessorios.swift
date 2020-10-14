//
//  CategoriaDeAcessorios.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 14/10/20.
//

import Foundation

public struct CategoriaDeAcessorios: Decodable {
    let categoria: String
    let itens: [Acessorio]
}
