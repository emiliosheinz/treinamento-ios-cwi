//
//  CategoriaDeCafeHeaderView.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 17/10/20.
//

import UIKit

class CategoriaDeCafeHeaderView: UIView {

    @IBOutlet weak var tituloLabel: UILabel!
    
    func configurar(para categoria: Categoria) {
        tituloLabel.text = categoria.categoria
    }

}
