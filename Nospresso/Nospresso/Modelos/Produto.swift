//
//  Produto.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import Foundation

protocol Produto: Codable {
    var id: Int { get }
    var nome: String { get }
    var preco: Double { get }
    var descricao: String { get }
    var imagem: String { get }
    
    var tipo: TipoProduto { get }
}

enum TipoProduto: String, Codable {
    case maquina, cafe, acessorio
}
