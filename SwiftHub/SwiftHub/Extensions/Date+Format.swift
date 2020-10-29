//
//  Date+Format.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import Foundation

extension Date {
    
    var formatted: String {
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy")
        
        return formatter.string(from: self)
    }
}
