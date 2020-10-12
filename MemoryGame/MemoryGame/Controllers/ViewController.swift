//
//  ViewController.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var game: MemoryGame = MemoryGame()
    var isShowingTwoCards = false
    var visibleCells: Dictionary<Int, CollectionViewCell> = [:]
    var isPremiumModeEnabled = false
    
    @IBOutlet weak var playsLabel: UILabel!
    @IBOutlet weak var collectionViewController: UICollectionView!
    
    @IBAction func restartButtonPress(_ sender: Any) {
        self.newGame()
    }
    
    @IBAction func onSilvaoPress(_ sender: Any) {
        var yesAction: UIAlertAction {
           UIAlertAction(
                title: "Sim",
                style: .default,
                handler: { _ in
                    self.isPremiumModeEnabled = true
                    self.newGame()
                }
           )
        }
        var noAction: UIAlertAction {
           UIAlertAction(
                title: "Não",
                style: .default,
                handler: nil
           )
        }
        
        let alert = UIAlertController(title: "MAOE, EASTEREGG ENCONTRADO!", message: "Você gostaria de ativar o modo premium e ter acesso a diversas cartas diferenciadas?", preferredStyle: .alert)
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
    
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

}

extension ViewController {
    
    var alertAction: UIAlertAction {
       UIAlertAction(title: "Bacana, bora de novo", style: .default, handler: { _ in self.newGame()})
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCard", for: indexPath) as! CollectionViewCell
        
        let currentImageName = game.cards[indexPath.item].imageName
        let currentCard = game.cards[indexPath.item]
        let imageName = currentCard.isIn(game.matchedCards) || currentCard.isIn(game.visibleCards) ? currentImageName : "hidden_card"
        
        cell.cellImage.image = UIImage(named: imageName)
        
        return cell.withShadow
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else {
            return
        }
        let wasInMatchdCardsArray = game.cards[indexPath.item].isIn(game.matchedCards)
        let wasInVisibleCardsArray = game.cards[indexPath.item].isIn(game.visibleCards)
        
        
        if !isShowingTwoCards {
            let hasMatched = game.guessCard(at: indexPath.item)

            playsLabel.text = "Jogadas: \(self.game.numberOfPlays)"

            if game.visibleCards.count == 2 {
                isShowingTwoCards = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.isShowingTwoCards = false
                    self.game.hideVisibleAndNotMatchedCards()
                    
                    self.visibleCells.forEach({ key, cell in
                        cell.flip(card: self.game.cards[key])
                    })
                    self.visibleCells = [:]
                }
            }

            if !wasInMatchdCardsArray && !wasInVisibleCardsArray {
                cell.flip(card: game.cards[indexPath.item])
                visibleCells[indexPath.item] = cell
                
                if hasMatched {
                    visibleCells = [:]
                }
            }

            if game.hasWon {
                showMessageForTheWinner()
            }
        }
    }
    
    func showMessageForTheWinner() {
        let alert = UIAlertController(title: "Boa, você terminou!", message: "Você precisou de \(game.numberOfPlays) tentativas para finalizar o jogo.", preferredStyle: .alert)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    func newGame() {
        self.game = MemoryGame(usePremiumCards: self.isPremiumModeEnabled)
        self.playsLabel.text = "Jogadas: 0"
        self.collectionViewController.reloadData()
    }
}

