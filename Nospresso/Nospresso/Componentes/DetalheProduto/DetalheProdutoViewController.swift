//
//  DetalheProdutoViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import UIKit

class DetalheProdutoViewController: UIViewController {

    let produto: Produto
    
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var adicionarASacolaButton: UIButton! {
        didSet {
            adicionarASacolaButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
            adicionarASacolaButton.layer.shadowOffset = CGSize(width: 2, height: 2)
            adicionarASacolaButton.layer.shadowRadius = 2
            adicionarASacolaButton.layer.shadowOpacity = 1
        }
    }
    
    @IBAction func toqueFechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    init(produto: Produto) {
        self.produto = produto
        
        super.init(nibName: R.nib.detalheProdutoViewController.name, bundle: .main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fotoImageView.carregarImagem(usando: produto.imagem)
        nomeLabel.text = produto.nome
        precoLabel.text = produto.preco.realFormatado
        descricaoLabel.text = produto.descricao
    }

}
