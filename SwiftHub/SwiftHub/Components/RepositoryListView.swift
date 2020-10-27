//
//  RepositoryListView.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 27/10/20.
//

import FetchImage
import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var image: FetchImage
    let repository: Repository
    
    
    private let minimumScaleFactor: CGFloat = 0.7
    
    init(_ repository: Repository) {
        self.repository = repository
        image = FetchImage(url: URL(string: repository.owner.pictureURL)!)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(repository.name)
                    .bold()
                    .font(.title2)
                    .minimumScaleFactor(minimumScaleFactor)
                
                Text(repository.description ?? "Sem descrição")
                    .font(.subheadline)
                    .foregroundColor(Color("discreteGray"))
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(minimumScaleFactor)
                
                Spacer()
                
                HStack {
                    Text(repository.starCount.description)
                    Text("⭐️")
                        .baselineOffset(3)
                }
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 4) {
                image
                    .view?
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                Text(repository.owner.name)
                    .font(.subheadline)
                    .minimumScaleFactor(minimumScaleFactor)
                    .frame(maxWidth: 60)
                    .lineLimit(1)
            }
        }
        .frame( maxWidth: .infinity, idealHeight: 100, alignment: .leading)
        .padding(10)
        .onAppear {
            self.image.priority = .normal
            self.image.fetch()
        }
        .onDisappear {
            self.image.priority = .low
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(.mocked)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
