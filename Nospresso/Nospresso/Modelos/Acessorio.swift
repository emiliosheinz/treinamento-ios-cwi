//
//  Acessorio.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 14/10/20.
//

import Foundation

public struct Acessorio: Decodable {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String
}
