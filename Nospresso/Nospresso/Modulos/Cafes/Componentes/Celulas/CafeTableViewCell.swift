//
//  CafeTableViewCell.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 15/10/20.
//

import UIKit

class CafeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagemCelula: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var intensidade: UILabel!
    @IBOutlet weak var preco: UILabel!
    
    func configurar(com cafe: Cafe) {
        imagemCelula.carregarImagem(usando: cafe.imagem)
        titulo.text = cafe.nome
        descricao.text = cafe.descricao.capitalized
        intensidade.text = "Intensidade \(cafe.intensidade ?? 0)"
        preco.text = cafe.precoUnitario.realFormatado
    }
}
