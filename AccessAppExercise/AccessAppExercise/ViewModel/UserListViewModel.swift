//
//  UserListViewModel.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import Foundation

class UserListViewModel {
    
    
    // MARK: - Service
    var userListService:UserListService = UserListService()
    
    // MARK: - Properties
    var shouldUpdateUserList: ((_ users: [User]) -> Void)?
    
    var users: Array<User> = [] {
        didSet{
            self.shouldUpdateUserList?(users)
        }
    }
    func fetchUserList() {
        var id = "0"
        if let lastUser = users.last, let _ = lastUser.id {
            id = "\(lastUser.id!)"
        }
        userListService.fetchUserList(id: id) { (users) in
            self.users.append(contentsOf: users)
        }
    }
}
