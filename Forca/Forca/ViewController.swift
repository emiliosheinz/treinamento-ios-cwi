//
//  ViewController.swift
//  Forca
//
//  Created by Emilio Heinzmann on 06/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var bodyImageView: UIImageView!
    
    var index: Int = 1;
    
    @IBAction func onRefreshPress(_ sender: Any) {
        index += 1
        
        UIView.transition(
            with: bodyImageView,
            duration: 0.1,
            options: .transitionCrossDissolve,
            animations: {
                self.bodyImageView.image = UIImage(named: "body_level_\(self.index)")
            },
            completion: nil
        )
        
        
        
        if index == 5 {
            index = 0
        }
    }
    
    @IBAction func onDonePress(_ sender: Any) {
       dismissKeyboard()
    }
    
}

