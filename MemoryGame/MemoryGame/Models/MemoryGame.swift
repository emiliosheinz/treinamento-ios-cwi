//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import Foundation

public class MemoryGame {
    
    let cards: [Card]
    
    internal init() {
        self.cards = randomCardsArrayGenerator()
    }
    
}
