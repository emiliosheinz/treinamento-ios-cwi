//
//  String+AttributedText.swift
//  Forca
//
//  Created by Emilio Heinzmann on 08/10/20.
//

import Foundation

public extension String {
    var spaced: NSMutableAttributedString {
        let spacementAttibute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: spacementAttibute)
    }
}
