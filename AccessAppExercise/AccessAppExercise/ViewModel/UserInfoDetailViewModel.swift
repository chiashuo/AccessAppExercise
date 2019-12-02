//
//  UserInfoDetailViewModel.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import Foundation
class UserInfoDetailViewModel {
    
    // MARK: - Service
    var userInfoDetailService:UserInfoDetailService = UserInfoDetailService()
    
    // MARK: - Properties
    var shouldUpdateUserDeatil: ((_ userInfoDetail:UserInfoDetail) -> Void)?
    
    /// user info detail object
    var userInfoDetail: UserInfoDetail? {
        didSet{
            self.shouldUpdateUserDeatil?(userInfoDetail!)
        }
    }
    
    /// call api
    /// - Parameter userName: 使用者名稱
    func fetchUserInfo(userName:String) {
        userInfoDetailService.fetchUserInfoDeatil(userName: userName) { [weak self] (userInfoDetail)  in
            if let _ = userInfoDetail{
                self?.userInfoDetail = userInfoDetail!
            }
        }
    }
}
