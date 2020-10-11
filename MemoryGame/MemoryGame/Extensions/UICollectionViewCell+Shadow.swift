//
//  UICollectionViewCell+Shadow.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 11/10/20.
//

import UIKit

extension UICollectionViewCell {
    var withShadow: UICollectionViewCell {
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        
        return self
    }
}
