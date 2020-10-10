//
//  Character+Comparable.swift
//  Forca
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import Foundation
extension Character {
    var comparable: String {
        self.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
