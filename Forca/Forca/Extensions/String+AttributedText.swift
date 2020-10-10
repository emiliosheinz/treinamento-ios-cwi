//
//  String+AttributedText.swift
//  Forca
//
//  Created by Emilio Heinzmann on 08/10/20.
//

import UIKit

public extension String {
    var spaced: NSMutableAttributedString {
        let spacementAttibute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: spacementAttibute)
    }
    
    var green: NSMutableAttributedString {
        let greenAtt: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green
        ]
        
        return NSMutableAttributedString(string: self, attributes: greenAtt)
    }
    
    var red: NSMutableAttributedString {
        let redAtt: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        
        return NSMutableAttributedString(string: self, attributes: redAtt)
    }
}

public extension NSMutableAttributedString {
    var spaced: NSMutableAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        
        let spacementAttibute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        copy.addAttributes(spacementAttibute, range: NSMakeRange(0, copy.length))
        return copy
    }
}
