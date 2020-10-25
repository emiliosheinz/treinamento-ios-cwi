//
//  MaquinasViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 22/10/20.
//

import UIKit

class MaquinasViewController: UIViewController {
    
    typealias Presenter = MaquinasPresenterType & UICollectionViewDataSource
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var presenter: Presenter = MaquinasPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self.presenter
        collectionView.register(R.nib.maquinaCollectionViewCell)
        presenter.telaCarregou()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = Paleta.maquinas()
        navigationController?.navigationBar.tintColor = .black
    }

}

extension MaquinasViewController: MaquinasViewType {
    func exibirTitulo(_ titulo: String) {
        title = titulo
    }
    
    func recarregarColecao() {
        collectionView.reloadData()
    }
}

extension MaquinasViewController: UICollectionViewDelegateFlowLayout {
    enum ConstantesDeLayout {
        static let alturaDaCelula = 260
        static let larguraDaCelula = 175
        static let espacamentoPadrao = 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: ConstantesDeLayout.larguraDaCelula, height: ConstantesDeLayout.alturaDaCelula)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(ConstantesDeLayout.espacamentoPadrao)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(ConstantesDeLayout.espacamentoPadrao)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insets = CGFloat(ConstantesDeLayout.espacamentoPadrao)
        
        return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
}
