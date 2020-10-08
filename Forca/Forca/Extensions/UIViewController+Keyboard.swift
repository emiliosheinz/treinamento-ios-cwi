//
//  UIViewController+Keyboard.swift
//  Forca
//
//  Created by Emilio Heinzmann on 06/10/20.
//

import UIKit

public extension UIViewController {
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
