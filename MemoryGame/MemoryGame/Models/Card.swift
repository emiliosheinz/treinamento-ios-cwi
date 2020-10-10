//
//  Card.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import Foundation

public class Card {
    
    let variation: Int
    let imageName: String
    let id: String
    
    internal init(variation: Int, imageName: String) {
        self.variation = variation
        self.imageName = imageName
        self.id = "\(imageName)_\(variation)"
   }
    
}

extension Card {
    func isIn(_ cards: [Card]) -> Bool {
        return cards.contains(where: {_card in return self.id == _card.id})
    }
}

