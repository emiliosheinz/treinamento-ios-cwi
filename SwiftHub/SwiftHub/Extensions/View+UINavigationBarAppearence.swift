//
//  View+UINavigationBarAppearence.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 27/10/20.
//

import SwiftUI

extension View {
    func configNavigationBarAppearence() {
        let appearence = UINavigationBarAppearance()
        
        appearence.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearence.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        appearence.backgroundColor = UIColor(named: "mainPurple")
        
        UINavigationBar.appearance().standardAppearance = appearence
        UINavigationBar.appearance().compactAppearance = appearence
        UINavigationBar.appearance().scrollEdgeAppearance = appearence
    }
}
