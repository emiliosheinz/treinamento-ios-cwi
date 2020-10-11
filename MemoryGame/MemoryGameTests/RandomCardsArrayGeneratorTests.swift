//
//  RandomCardsArrayGeneratorTests.swift
//  MemoryGameTests
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import XCTest
import Quick
import Nimble

@testable import MemoryGame

class RandomCardsArrayGeneratorTests: QuickSpec {
    
    override
    func spec() {
        let cards:[Card] = randomCardsArrayGenerator()
        
        describe("when calling the funcion") {
            it("should create an array with 10 of length") {
                expect(cards.count).to(equal(10))
            }
            
            it("should add two cards of each image") {
                var imagesDictionary: Dictionary<String, Int> = [:]
                
                cardsAvailableImages.forEach({ key in
                    imagesDictionary[key] = 0
                })
                
                cards.forEach({ card in
                    imagesDictionary[card.imageName]! +=  1
                })
                
                imagesDictionary.forEach({ _, value in
                    expect(value).to(equal(2))
                })
            }
        }
    }
    
}
