//
//  MedidaView.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 22/10/20.
//

import UIKit

class MedidaView: UIView {

    class func doNib() -> MedidaView {
        R.nib.medidaView.firstView(owner: nil)!
    }
    
    @IBOutlet weak var canequinaImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!

    
    func configurar(com medida: Cafe.Medida) {
        canequinaImageView.image = medida.imagem
        nomeLabel.text = medida.rawValue
    }
}

extension Cafe.Medida {
    var imagem: UIImage? {
        switch self {
        case .ristretto:
            return Images.ic_ristreto()
        case .espresso:
            return Images.ic_espresso()
        case .lungo:
            return Images.ic_lungo()
        }
    }
}


