//
//  RepositoryListView.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 27/10/20.
//

import FetchImage
import SwiftUI

struct RepositoryListView: View {
    let repository: Repository
    
    private let minimumScaleFactor: CGFloat = 0.7
    
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
            
            OwnerUserView(repository.owner)
        }
        .frame( maxWidth: .infinity, idealHeight: 100, alignment: .leading)
        .padding(10)
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(repository: .mocked)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}

struct OwnerUserView: View {
    
    @ObservedObject var image: FetchImage
    @State private var userDetailPresented: Bool = false
    
    var owner: Repository.Owner
    
    init(_ owner: Repository.Owner) {
        self.owner = owner
        image = FetchImage(url: URL(string: owner.pictureURL)!)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            image
                .view?
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(owner.name)
                .font(.subheadline)
                .frame(maxWidth: 60)
                .lineLimit(1)
        }
        .onAppear {
            self.image.priority = .normal
            self.image.fetch()
        }
        .onDisappear {
            self.image.priority = .low
        }
        .onTapGesture(count: 1) {
            userDetailPresented = true
        }
        .sheet(isPresented: $userDetailPresented) {
            UserDetailView(url: owner.profileURL, isPresented: $userDetailPresented)
        }
    }
}

