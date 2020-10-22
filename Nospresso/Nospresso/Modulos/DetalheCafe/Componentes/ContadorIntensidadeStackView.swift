//
//  ContadorIntensidadeStackView.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 20/10/20.
//

import UIKit

class ContadorIntensidadeStackView: UIStackView {
    
    let tamanhoBolinha: CGFloat = 7
    let intensidadeMaxima: Int = 13
    
    func gerarBolinha(preenchida: Bool) -> UIView {
        let bolinha = UIView()
        
        NSLayoutConstraint.activate([
            bolinha.heightAnchor.constraint(equalToConstant: tamanhoBolinha),
            bolinha.widthAnchor.constraint(equalToConstant: tamanhoBolinha),
        ])
        
        bolinha.layer.cornerRadius = tamanhoBolinha / 2
        bolinha.layer.borderWidth = 0.4
        
        
        bolinha.layer.borderColor = (preenchida ? UIColor.black : Paleta.bordaIntensidadeVazia())?.cgColor
        bolinha.backgroundColor = preenchida ? Paleta.intensidadePreenchida() : Paleta.intensidadeVazia()
        
        return bolinha
    }
    
    func configurar(para intensidade: Int) {
        let quantidadeDeBolasVazias = intensidadeMaxima - intensidade
        
        
        for _ in 0..<intensidade {
            let bolinha = gerarBolinha(preenchida: true)
            addArrangedSubview(bolinha)
        }
        
        for _ in 0..<quantidadeDeBolasVazias {
            let bolinha = gerarBolinha(preenchida: false)
            addArrangedSubview(bolinha)
        }
        
        addArrangedSubview(UIView())
    }
}

