//
//  CarregamentoViewController.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 25/10/20.
//

import UIKit

class CarregamentoViewController: UIViewController {

    class func doNib() -> CarregamentoViewController {
        let vc = CarregamentoViewController(nib: R.nib.carregamentoViewController)

        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        return vc
    }

}
