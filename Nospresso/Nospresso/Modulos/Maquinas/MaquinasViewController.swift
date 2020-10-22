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

}

extension MaquinasViewController: MaquinasViewType {
    func recarregarColecao() {
        collectionView.reloadData()
    }
}

extension MaquinasViewController: UICollectionViewDelegateFlowLayout {
    enum ConstantesDeLayout {
        static let alturaDaCelula = 260
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
}
