//
//  CollectionViewCell.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!

    func flip(card: Card) {
        
        UIView.transition(
            with: self,
            duration: 0.3,
            options: card.isHidden ? .transitionFlipFromLeft : .transitionFlipFromRight,
            animations: {
                let imageName = card.isHidden ? "hidden_card" : card.imageName
                self.cellImage.image =  UIImage(named: imageName)
            },
            completion: nil
        )
    }
}
