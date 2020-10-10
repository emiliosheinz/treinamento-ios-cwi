//
//  ViewController.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var game: MemoryGame = MemoryGame()
    
    @IBOutlet weak var collectionViewController: UICollectionView!
    
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
        
        let currentImageName = game.cards[indexPath.item].imageName
        let currentCard = game.cards[indexPath.item]
        let imageName = currentCard.isIn(game.matchedCards) || currentCard.isIn(game.visibleCards) ? currentImageName : "hidden_card"
        cell.cellImage.image = UIImage(named: imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        game.guessCard(at: indexPath.item, collectionViewController: collectionViewController)
    }
}

extension ViewController {
    @IBAction func restartButtonPress(_ sender: Any) {
        self.game = MemoryGame()
        self.collectionViewController.reloadData()
    }
}

