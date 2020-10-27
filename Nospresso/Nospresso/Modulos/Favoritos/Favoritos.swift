//
//  Favoritos.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import Foundation

class Favoritos {
    static let instancia = Favoritos()
    
    let chaveFavoritos = "nospresso-favoritos"
    let userDefaults = UserDefaults.standard
    
    var listaDeProdutos: [Favorito] = []
    
    func alternar(_ produto: Produto) -> Bool {
        let favorito = Favorito(produto: produto)
        
        defer {
            atualizarArmazenamentoLocal()
        }
        
        if let indiceDoProduto = listaDeProdutos.firstIndex(of: favorito) {
            listaDeProdutos.remove(at: indiceDoProduto)
            return false
        }
    
        listaDeProdutos.append(favorito)
        return true
    }
    
    func remover(produto: Produto) {
        let favorito = Favorito(produto: produto)
        
        if let indiceDoProduto = listaDeProdutos.firstIndex(of: favorito) {
            listaDeProdutos.remove(at: indiceDoProduto)
            atualizarArmazenamentoLocal()
        }
    }
    
    func estaFavoritado(produto: Produto) -> Bool {
        listaDeProdutos.contains(.init(produto: produto))
    }
    
    private init() {
        buscarDoArmazenamentoLocal()
    }
    
}

private extension Favoritos{
    private func atualizarArmazenamentoLocal() {
        guard let dadosCodificados = try? JSONEncoder().encode(listaDeProdutos) else {
            return
        }
        
        userDefaults.setValue(dadosCodificados, forKey: chaveFavoritos)
    }
    
    private func buscarDoArmazenamentoLocal() {
        guard let dados = userDefaults.data(forKey: chaveFavoritos),
              let favoritosDecodificados = try? JSONDecoder().decode([Favorito].self, from: dados)
            else {
                return
            }
        
        listaDeProdutos = favoritosDecodificados
    }
}
