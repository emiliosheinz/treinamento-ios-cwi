//
//  TextLinkView.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import SwiftUI

struct TextLinkView: View {
    
    var prefix: String = ""
    let title: String?
    let action: () -> Void
    
    var body: some View {
        if let title = title {
            HStack(spacing: 0) {
                Text(prefix)
                    .foregroundColor(.discreteGray)
                Button(action: action) {
                    Text(title)
                        .underline()
                }
            }.accentColor(.mainPurple)
        } else {
            EmptyView()
        }
    }
}

struct TextLinkView_Previews: PreviewProvider {
    static var previews: some View {
        TextLinkView(title: "Foo") {
            print("foo")
        }
    }
}
