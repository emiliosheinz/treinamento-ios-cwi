//
//  Cafe.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 13/10/20.
//

import Foundation


public struct Cafe: Decodable {
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

    
    enum Medida: String, Decodable {
        case lungo, espresso, ristretto
    }
}
