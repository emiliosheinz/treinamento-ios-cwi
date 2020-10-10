//
//  ForcaGame.swift
//  Forca
//
//  Created by Emilio Heinzmann on 08/10/20.
//

import Foundation

class ForcaGame {
    
    let maxNumberOfErrors = 5
    
    let word: String
    let tip: String
    private(set) var maskedWord: String
    private(set) var alreadyTriedLetters: [String] = []
    
    private(set) var errors: Int = 0 {
        didSet {
            if errors > maxNumberOfErrors {
                lose = true
            }
        }
    }
    
    private(set) var lose: Bool = false
    private(set) var win: Bool = false
    
    internal init(word: String, tip: String) {
        self.tip = tip
        self.word = word.comparable
        self.maskedWord = word.map { _ in "_"}.joined()
    }
    
    func tryLetter(letter: String) {
        guard let informedLetter = letter.first?.comparable else {
            return
        }
        
        if(alreadyTriedLetters.contains(informedLetter)) {
            return
        }
        
        alreadyTriedLetters.append(informedLetter)
        
        guard word.contains(informedLetter) else {
            errors += 1
            return
        }
        
        maskedWord = replaceUnderscoreWithLetter(replace: informedLetter, in: maskedWord, with: word)
        
        if word == maskedWord {
            win = true
        }
    }
    
}
