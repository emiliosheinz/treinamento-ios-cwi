//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoDoBotaoVoltar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
