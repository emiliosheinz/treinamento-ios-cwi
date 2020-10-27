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
    @IBOutlet weak var medidasStackView: UIStackView!
    @IBOutlet weak var intensidadeLabel: UILabel!
    @IBOutlet weak var intensidadeStackView: ContadorIntensidadeStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.telaCarregou()
    }
    
    @objc
    func toqueFavorito() {
        presenter?.tocouNoFavoritar()
    }
    
}

extension DetalheCafeViewController: DetalheCafeViewType {
    func exibirTitulo(_ titulo: String) {
        title = titulo
    }
    
    func exibirDados(do cafe: Cafe) {
        DispatchQueue.main.async {
            self.cafeImageView.carregarImagem(usando: cafe.imagem)
            if let intensidade = cafe.intensidade {
                self.intensidadeStackView.configurar(para: intensidade)
                
                self.intensidadeLabel.text = "Intensidade: \(intensidade)"
            } else {
                self.intensidadeLabel.isHidden = true
            }
            
            for medida in cafe.medidas {
                let view = MedidaView.doNib()
                
                view.configurar(com: medida)
                self.medidasStackView.addArrangedSubview(view)
            }
            
            self.medidasStackView.addArrangedSubview(UIView())
        }
    }
    
    func configuraFavoritismo(_ favoritado: Bool) {
        let imagem = favoritado ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        let tintura = favoritado ? Paleta.vermelhoAmor() : .black
        
        let botaoDeAcao = UIBarButtonItem.init(image: imagem, style: .plain, target: self, action: #selector(toqueFavorito))
        botaoDeAcao.tintColor = tintura
        
        navigationItem.rightBarButtonItem = botaoDeAcao
    }
}
