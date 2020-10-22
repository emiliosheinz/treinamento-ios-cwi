//
//  MaquinasPresenter.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 22/10/20.
//

import UIKit

class MaquinasPresenter: NSObject {
    
    var view: MaquinasViewType
    var maquinas: [Maquina] = []
    let api = Api()
    
    init (view: MaquinasViewType) {
        self.view = view
    }
}

extension MaquinasPresenter:  MaquinasPresenterType {
    func telaCarregou() {
        api.requisitar(
            endpoint: .maquinas,
            sucesso: { (maquinas: [Maquina]) in
                self.maquinas = maquinas
                
                DispatchQueue.main.async {
                    self.view.recarregarColecao()
                }
            },
            falha: {_ in})
    }
}

extension MaquinasPresenter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        maquinas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.maquinaCell, for: indexPath)!
        let maquina = maquinas[indexPath.item]
        
        celula.configurar(com: maquina)
        
        return celula
    }
}
