//
//  ViewController.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let game: MemoryGame = MemoryGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let landscapeRawValue = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(landscapeRawValue, forKey: "orientation")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }

    override var shouldAutorotate: Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.cellImage.image = UIImage(named: game.cards[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

extension ViewController {
    
}

