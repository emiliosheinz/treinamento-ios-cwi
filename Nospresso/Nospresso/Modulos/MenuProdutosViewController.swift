//
//  MenuProdutosViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 17/10/20.
//

import UIKit

class MenuProdutosViewController: UIViewController {
    
    @IBOutlet weak var maquinasView: UIView!
    
    @objc
    private func tocouEmMaquinas(_ remetente: Any) {
        let vc = MaquinasViewController(nib: R.nib.maquinasViewController)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removerTextoDoBotaoVoltar()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.tocouEmMaquinas))
        maquinasView.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
