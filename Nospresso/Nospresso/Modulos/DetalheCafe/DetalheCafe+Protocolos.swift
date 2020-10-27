//
//  DetalheCafe+Protocolos.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 20/10/20.
//

import Foundation

protocol DetalheCafeViewType {
    func exibirTitulo(_ titulo: String)
    func exibirDados(do cafe: Cafe)
    func configuraFavoritismo(_: Bool)
}

protocol DetalheCafePresenterType {
    func telaCarregou()
    func tocouNoFavoritar()
}
