//
//  Favorito.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import Foundation

struct Favorito: Produto {
    let id: Int
    let nome: String
    let preco: Double
    let descricao: String
    let imagem: String
    let tipo: TipoProduto
}

extension Favorito: Equatable {
    static func ==(lhs: Favorito, rhs: Favorito) -> Bool {
        lhs.id == rhs.id && lhs.tipo == rhs.tipo
    }
}

extension Favorito {
    init(produto: Produto) {
        self.id = produto.id
        self.nome = produto.nome
        self.preco = produto.preco
        self.descricao = produto.descricao
        self.imagem = produto.imagem
        self.tipo = produto.tipo
    }
}
