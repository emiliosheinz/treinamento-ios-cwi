//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

public class MemoryGame {
    
    let cards: [Card]
    var matchedCards: [Card]
    var visibleCards: [Card]
    
    internal init() {
        self.cards = randomCardsArrayGenerator()
        self.matchedCards = []
        self.visibleCards = []
    }
    
    func guessCard(at index: Int, collectionViewController: UICollectionView) {
        if self.visibleCards.count == 2 {
            
            if self.visibleCards[0].imageName  == self.visibleCards[1].imageName {
                self.matchedCards.append(contentsOf: self.visibleCards)
            }
            
            self.visibleCards = []
            collectionViewController.reloadData()
        }
        
        self.visibleCards.append(self.cards[index])
        collectionViewController.reloadData()
    }
    
}
