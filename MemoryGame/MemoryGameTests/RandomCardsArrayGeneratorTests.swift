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
        }
    }
    
}
