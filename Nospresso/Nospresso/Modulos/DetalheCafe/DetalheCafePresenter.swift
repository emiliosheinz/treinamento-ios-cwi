//
//  DetalheCafePresenter.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 20/10/20.
//

import UIKit

// Conecta model e view, orquestra tudo
class DetalheCafePresenter {
    var view: DetalheCafeViewType?
    var cafe: Cafe?
    let api = Api()
}

extension DetalheCafePresenter: DetalheCafePresenterType {
    func telaCarregou() {
        guard let cafe = cafe else {
            return
        }
        
        view?.exibirTitulo(cafe.nome)
        api.requisitar(
            endpoint: .cafe(id: cafe.id),
            sucesso: { (cafe: Cafe) in
                self.view?.exibirDados(do: cafe)
            },
            falha: {_ in })
    }
}

// MARK: Construtor
extension DetalheCafePresenter {
    class func criarModulo(passando cafe: Cafe) -> UIViewController {
//        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(identifier: "DetalheCafeViewController") as? DetalheCafeViewController
        
        let vc = R.storyboard.main.detalheCafeViewController()!
        let presenter = DetalheCafePresenter()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.cafe = cafe
        
        return vc
    }
}
