//
//  CollectionViewCell.swift
//  MemoryGame
//
//  Created by Emilio Heinzmann on 10/10/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!

    func flip(halfFlipCallback:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            halfFlipCallback()
        }
        UIView.transition(
            with: self,
            duration: 0.3,
            options: .transitionFlipFromRight,
            animations: nil,
            completion: nil
        )
    }
}
