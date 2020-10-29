//
//  UserDetailView.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import SwiftUI
import FetchImage

struct UserDetailView: View {
    
    @ObservedObject var viewModel: UserDetailViewModel
    @Binding var isPresented: Bool
    
    init(url: String, isPresented: Binding<Bool>) {
        viewModel = UserDetailViewModel(urlString: url)
        self._isPresented = isPresented
    }
    
    var body: some View {
        if let user = viewModel.user {
            UserDetailBodyView(user: user)
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .mainPurple))
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(url: Repository.mocked.owner.profileURL, isPresented: .constant(true))
    }
}

struct UserDetailBodyView: View {
    
    var user: User
    @ObservedObject var image: FetchImage
    
    init(user: User) {
        self.user = user
        image = FetchImage(url: URL(string: user.pictureURL)!)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            image.vi
        }
    }
}
