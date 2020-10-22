//
//  MaquinaCollectionViewCell.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 22/10/20.
//

import UIKit

class MaquinaCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var favoritarButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurar(com maquina: Maquina) {
        tituloLabel.text = maquina.nome
        fotoImageView.carregarImagem(usando: maquina.imagem)
        precoLabel.text = maquina.preco.realFormatado
    }

}
