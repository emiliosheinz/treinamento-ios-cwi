//
//  RandomCardsArrayGenerator.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import Foundation

let cardsAvailableImages = ["dwarf", "elf", "knight", "witch", "wizard"]
let premiumAvailableImages = ["nardon", "hedo", "elia", "rigotti", "poze", "backes", "wille", "emilio", "camille", "silvao"]

public func randomCardsArrayGenerator(usePremiumCards: Bool = false) -> [Card] {
    var cards:[Card] = []
    
    var images = Array(usePremiumCards ? premiumAvailableImages : cardsAvailableImages)
    
    for _ in 1...5 {
        let randomIndex = Int.random(in: 0..<images.count)
        let selectedImage = images.remove(at: randomIndex)
        
        cards.append(Card(variation: 0, imageName: selectedImage))
        cards.append(Card(variation: 1, imageName: selectedImage))
    }
    
    return cards.shuffled()
}
