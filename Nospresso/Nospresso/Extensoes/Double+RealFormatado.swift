//
//  String+DinheiroFormatado.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 17/10/20.
//

import Foundation

extension Double {
    var realFormatado: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt-BR")
        formatter.numberStyle = .currency
        guard let formattedTipAmount = formatter.string(from: self as NSNumber) else {
            return "R$ 0,00"
        }
        
        return formattedTipAmount
    }
}
