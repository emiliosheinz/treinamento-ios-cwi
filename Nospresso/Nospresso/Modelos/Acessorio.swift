//
//  Acessorio.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 14/10/20.
//

import Foundation

struct Acessorio: Produto {
    let id: Int
    let nome: String
    let preco: Double
    let imagem: String
    let descricao: String
    
    var tipo: TipoProduto { .acessorio }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.nome = try container.decode(String.self, forKey: .nome)
        self.preco = try container.decode(Double.self, forKey: .preco)
        self.descricao = try container.decodeIfPresent(String.self, forKey: .descricao) ?? ""
        self.imagem = try container.decode(String.self, forKey: .imagem)
    }

    enum CodingKeys: String, CodingKey {
        case id, nome, preco, descricao, imagem
    }
}
