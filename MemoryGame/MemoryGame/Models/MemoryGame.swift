//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

public class MemoryGame {
    
    let cards: [Card]
    private(set) var matchedCards: [Card] = [] {
        didSet {            
            if cards.count == matchedCards.count {
                hasWon = true
            }
        }
    }
    private(set) var visibleCards: [Card] = []
    private(set) var numberOfPlays: Int = 0
    private(set) var hasWon: Bool = false
    
    internal init(usePremiumCards: Bool = false) {
        self.cards = randomCardsArrayGenerator(usePremiumCards: usePremiumCards)
    }
    
    func guessCard(at index: Int) -> Bool {
        let wasInArray = self.cards[index].isIn(self.visibleCards) || self.cards[index].isIn(self.matchedCards)
        
        if !wasInArray {
            self.cards[index].isHidden = false
            self.visibleCards.append(self.cards[index])
        }
        
        if self.visibleCards.count == 2 {
            self.numberOfPlays += 1
            
            if self.visibleCards[0].imageName  == self.visibleCards[1].imageName {
                self.matchedCards.append(contentsOf: self.visibleCards)
                self.visibleCards = []
                return true
            }
        }
        
        return false
    }
    
    func hideVisibleAndNotMatchedCards() {
        self.visibleCards.forEach({ card in
            card.isHidden = true
        })
        
        self.visibleCards = []
    }
    
}
