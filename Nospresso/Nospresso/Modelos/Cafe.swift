//
//  Cafe.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 13/10/20.
//

import Foundation


public struct Cafe: Produto {
    
    let id: Int
    let nome: String
    let precoUnitario: Double
    let descricao: String
    let imagem: String
    let medidas: [Medida]
    let origem: String?
    let intensidade: Int?
    let torrefacao: String?
    let perfilAromatico: String?
    var tipo: TipoProduto { .cafe }
    var preco: Double { precoUnitario }

    enum Medida: String, Codable {
        case lungo, espresso, ristretto
    }
}
