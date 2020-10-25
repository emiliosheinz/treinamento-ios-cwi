//
//  MaquinasProtocols.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 22/10/20.
//

import Foundation

protocol MaquinasViewType {
    func recarregarColecao()
    func exibirTitulo(_ titulo: String)
}

protocol MaquinasPresenterType {
    func telaCarregou()
}
