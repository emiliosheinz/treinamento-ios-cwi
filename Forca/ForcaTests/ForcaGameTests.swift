//
//  ForcaGameTests.swift
//  ForcaTests
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import XCTest
import Quick
import Nimble

@testable import Forca

class ForcaGameTests: QuickSpec {
    
    override
    func spec() {
        var game: ForcaGame!

        // Before each it
        beforeEach {
            game = ForcaGame(word: "JACARÉ", tip: "ANIMAL")
        }
        
        describe("when playing normally") {
            context("and input a right letter") {
                it("should not have any error") {
                    game.tryLetter(letter: "É")
                    
                    expect(game.errors).to(equal(.zero))
                }
                
                it("should update the mask") {
                    game.tryLetter(letter: "É")
                    
                    expect(game.maskedWord).to(equal("_____E"))
                }
            }
            
            context("and input a wrong letter") {
                it("should have only one error") {
                    game.tryLetter(letter: "G")
                    
                    expect(game.errors).to(equal(1))
                }
            }
            
            context("and repeat a wrong letter") {
                it("should have only one error") {
                    game.tryLetter(letter: "G")
                    game.tryLetter(letter: "G")
                    
                    expect(game.errors).to(equal(1))
                }
            }
            
            context("trying wrong 5 times") {
                it("should lose the game") {
                    let tries = ["I", "B", "P", "Z", "K"]
                    
                    for letter in tries {
                        game.tryLetter(letter: letter)
                    }
                    
                    expect(game.lose).to(beFalse())
                    
                    game.tryLetter(letter: "W")
                    
                    expect(game.lose).to(beTrue())
                }
            }
            
            context("with a right repeated letter") {
                it("should update more than one space in the mask") {
                    game.tryLetter(letter: "A")
                    
                    expect(game.maskedWord).to(equal("_A_A__"))
                }
            }
            
            context("and input a right letter more than one time") {
                it("should update the mask and have no error") {
                    game.tryLetter(letter: "J")
                    game.tryLetter(letter: "J")
                    
                    expect(game.maskedWord).to(equal("J_____"))
                    expect(game.errors).to(equal(.zero))
                }
            }
            
            context("with all letters right") {
                it("should win the game") {
                    ["J", "A", "C", "R"].forEach(game.tryLetter)
                    
                    expect(game.win).to(beFalse())
                    
                    game.tryLetter(letter: "E")
                    
                    expect(game.win).to(beTrue())
                    expect(game.maskedWord).to(equal("JACARE"))
                }
            }
            
            context("with all letters right and 5 wrong") {
                it("should win the game") {
                    ["J", "A", "C", "R"].forEach(game.tryLetter)
                    
                    expect(game.win).to(beFalse())
                    
                    ["I", "B", "P", "Z", "K"].forEach(game.tryLetter)
                    
                    expect(game.lose).to(beFalse())
                    expect(game.maskedWord).to(equal("JACAR_"))
                    
                    game.tryLetter(letter: "E")
                    
                    expect(game.win).to(beTrue())
                    expect(game.maskedWord).to(equal("JACARE"))
                }
            }
        }
    }
    
}
