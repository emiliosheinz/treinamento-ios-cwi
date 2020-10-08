//
//  ForcaTests.swift
//  ForcaTests
//
//  Created by Emilio Heinzmann on 06/10/20.
//

import XCTest
@testable import Forca

class ForcaTests: XCTestCase {

    func testReplace() throws {
        let word = "DOGG"
        var mask = "____"
        
        mask = replaceUnderscoreWithLetter(replace: "G", in: mask, with: word)
        
        XCTAssertEqual(mask, "__GG", mask)
        
        mask = replaceUnderscoreWithLetter(replace: "X", in: mask, with: word)
        
        XCTAssertEqual(mask, "__GG", mask)
    }

}
