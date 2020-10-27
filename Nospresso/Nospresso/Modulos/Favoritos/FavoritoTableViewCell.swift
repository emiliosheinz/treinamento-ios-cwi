//
//  FavoritoTableViewCell.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import UIKit

class FavoritoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    
    func configurar(com produto: Produto) {
        fotoImageView.carregarImagem(usando: produto.imagem)
        tituloLabel.text = produto.nome
        tipoLabel.text = produto.tipo.rawValue.uppercased()
        precoLabel.text = produto.preco.realFormatado
    }
}
