//
//  MaquinasProtocols.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 22/10/20.
//

import Foundation

protocol MaquinasViewType: CarregamentoViewType {
    func recarregarColecao()
    func exibirTitulo(_ titulo: String)
}

protocol MaquinasPresenterType {
    var maquinas: [Maquina] { get }
    func telaCarregou()
}
