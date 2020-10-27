//
//  CarregamentoViewType.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import UIKit

protocol CarregamentoViewType: AnyObject {
    var telaDeCarregamento: CarregamentoViewController? { get set }
    func exibirCarregamento()
    func dispensarCarregamento()
}

extension CarregamentoViewType where Self: UIViewController {
    func exibirCarregamento() {
        telaDeCarregamento = CarregamentoViewController.doNib()
        
        present(telaDeCarregamento!, animated: true)
    }
    
    func dispensarCarregamento() {
        telaDeCarregamento?.dismiss(animated: true, completion: nil)
        
        telaDeCarregamento = nil
    }
}
