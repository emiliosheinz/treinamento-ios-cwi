//
//  FavoritosViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import UIKit

class FavoritosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var produtos: [Produto] {
        Favoritos.instancia.listaDeProdutos
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FavoritosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let acao = UIContextualAction(style: .destructive, title: "Remover") { (acao, view, handler) in
            let produto = self.produtos[indexPath.row]
            
            Favoritos.instancia.remover(produto: produto)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            handler(true)
        }
        
        return .init(actions: [acao])
    }
}

extension FavoritosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        produtos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.favoritosCell, for: indexPath)!
        
        celula.configurar(com: produtos[indexPath.row])
        
        return celula
    }
    
    
}
