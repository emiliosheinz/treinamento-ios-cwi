//
//  RepositoryDetailView.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import SwiftUI

struct RepositoryDetailView: View {
    
    let repository: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(repository.language)
            Text(repository.description ?? "Sem descrição")
            
            Spacer().frame(height: 20)
            
            Group {
                TextLinkView(prefix: "by: ", title: repository.owner.name) {}
                TextLinkView(prefix: "license: ", title: repository.license?.name) {}
                TextLinkView(title: repository.webPage) {}
            }
            
            Spacer()
            
            DateView(title: "created at:", date: repository.created)
            DateView(title: "last update:", date: repository.created)
            
            Spacer()
            
            HStack {
                NumericInfoView(value: repository.watchers, title: "watchers")
                Spacer()
                NumericInfoView(value: repository.openIssues, title: "opne issues")
                Spacer()
                NumericInfoView(value: repository.forks, title: "forks")
            }
        }
        .padding(40)
        .navigationBarTitle(repository.name, displayMode: .inline)
    }
}

struct RepositoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailView(repository: .mocked)
    }
}

struct DateView: View {
    
    let title: String
    let date: Date
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.discreteGray)
            Spacer()
            Text(date.formatted)
        }
    }
}
