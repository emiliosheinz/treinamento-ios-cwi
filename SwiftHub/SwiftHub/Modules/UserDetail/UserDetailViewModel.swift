//
//  UserDetailViewModel.swift
//  SwiftHub
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import Foundation

class UserDetailViewModel: ObservableObject {

    @Published var user: User?
    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
        fetchUser()
    }

    func fetchUser() {
        Requester.request(with: .init(path: urlString)) { [weak self] (result: Result<User, APIError>) in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self?.user = user
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
