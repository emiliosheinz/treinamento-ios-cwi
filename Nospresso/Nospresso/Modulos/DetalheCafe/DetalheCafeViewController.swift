//
//  DetalheCafeViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 20/10/20.
//

import UIKit

class DetalheCafeViewController: UIViewController {
    var presenter: DetalheCafePresenterType?
    
    @IBOutlet weak var cafeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.telaCarregou()
    }

}

extension DetalheCafeViewController: DetalheCafeViewType {
    func exibirTitulo(_ titulo: String) {
        title = titulo
    }
    
    func exibirDados(do cafe: Cafe) {
        DispatchQueue.main.async {
            self.cafeImageView.carregarImagem(usando: cafe.imagem)
        }
    }
}
