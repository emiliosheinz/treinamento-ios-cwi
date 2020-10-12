//
//  MemoryGameTests.swift
//  MemoryGameTests
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import XCTest
import Quick
import Nimble

@testable import MemoryGame

class MemoryGameTests: QuickSpec {

    override
    func spec() {
        var game: MemoryGame!
        
        beforeEach {
            game = MemoryGame()
        }
        
        describe("when creating a new game") {
            
            context("and do nothing") {
                
                it("should have 10 cards") {
                    expect(game.cards.count).to(equal(10))
                }
                
                it("should have no matched cards") {
                    expect(game.matchedCards.count).to(equal(0))
                }
                
                it("should have no visible cards") {
                    expect(game.visibleCards.count).to(equal(0))
                }
                
                it("should have hasWon equals false") {
                    expect(game.hasWon).to(beFalse())
                }
                
                it("should have no plays registered") {
                    expect(game.numberOfPlays).to(equal(0))
                }
            }
            
            context("and guess 2 cards") {
                func guessTwoCards() {
                    game.guessCard(at: 0)
                    game.guessCard(at: 1)
                }
                
                it("should increase the number of plays") {
                    guessTwoCards()
                    
                    expect(game.numberOfPlays).to(equal(1))
                }
                
                it("should have two cards in visible cards array or in matched cards array") {
                    guessTwoCards()
                    
                    let numberOfVisibleCards = game.visibleCards.count + game.matchedCards.count
                    
                    expect(numberOfVisibleCards).to(equal(2))
                }
                
                it("should not have won the game") {
                    guessTwoCards()
                    
                    expect(game.hasWon).to(beFalse())
                }
            }
            
            context("guess 2 cards and call hide visible and not matche cards") {
                func guessTwoCards() {
                    game.guessCard(at: 0)
                    game.guessCard(at: 1)
                }
                
                it("should clean up the number os visible cards") {
                    guessTwoCards()
                    
                    game.hideVisibleAndNotMatchedCards()
                    
                    expect(game.visibleCards.count).to(equal(0))
                }
            }
            
        }
    }

}
