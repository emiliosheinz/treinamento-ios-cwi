//
//  RandomCardsArrayGenerator.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import Foundation

let cardsAvailableImages = ["dwarf", "elf", "knight", "witch", "wizard"]

public func randomCardsArrayGenerator() -> [Card] {
    var cards:[Card] = []
    
    for image in cardsAvailableImages {
        cards.append(Card(variation: 0, imageName: image))
        cards.append(Card(variation: 1, imageName: image))
    }
    
    return cards.shuffled()
}
