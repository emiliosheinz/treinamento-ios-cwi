//
//  ViewController.swift
//  Forca
//
//  Created by Emilio Heinzmann on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var maskedWordLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var bodyImageView: UIImageView!
    @IBOutlet weak var letterTextField: UITextField!
    
    var game: ForcaGame = ForcaGame(word: "DESNATADO", tip: "MICROFONE")
    var index: Int = 1;

    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen()
    }
    
    @IBAction func onTextFieldChange(_ sender: Any) {
        letterTextField.text = letterTextField.text?.last?.uppercased()
    }
    
    @IBAction func onRefreshPress(_ sender: Any) {
        index += 1
        
        if index == 5 {
            index = 0
        }
    }
    
    @IBAction func onDonePress(_ sender: Any) {
        if let text = letterTextField.text {
            game.tryLetter(letter: text)
            updateScreen()
        }
    }
    
}

extension ViewController {
    private func updateScreen() {
        tipLabel.text = "A dica é: \(game.tip)"
        maskedWordLabel.attributedText = game.maskedWord.spaced
        guessLabel.attributedText = game.alreadyTriedLetters.joined().spaced
        
        updateImage()
    }
    
    private func updateImage() {
        let image: UIImage?
        
        if game.lose {
            image = UIImage(named: "body_level_6")
        } else if game.errors == 0 {
            image = nil
        } else {
            image = UIImage(named: "body_level_\(game.errors)")
        }
        
        UIView.transition(
            with: bodyImageView,
            duration: 0.1,
            options: .transitionCrossDissolve,
            animations: {
                self.bodyImageView.image = image
            },
            completion: nil
        )
    }
}

