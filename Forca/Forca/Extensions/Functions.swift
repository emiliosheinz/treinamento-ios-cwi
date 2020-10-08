//
//  Functions.swift
//  Forca
//
//  Created by Emilio Heinzmann on 08/10/20.
//

import Foundation

func replaceUnderscoreWithLetter(replace letter:String, in maskedWord: String, with originalWord: String) -> String {
    let character = Character(letter)
    var result = maskedWord
    
    for index in originalWord.indices {
        if originalWord[index] == character {
            result.remove(at: index)
            result.insert(character, at: index)
        }
    }
    
    return result
}
