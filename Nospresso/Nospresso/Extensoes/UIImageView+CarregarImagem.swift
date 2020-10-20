//
//  UIImageView+CarregarImagem.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 17/10/20.
//

import UIKit
import Nuke

extension UIImageView {
    
    func carregarImagem(usando url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let opcoes = ImageLoadingOptions(placeholder: UIImage(systemName: "photo"))
        
        Nuke.loadImage( with: url, options: opcoes, into: self)
    }
}
