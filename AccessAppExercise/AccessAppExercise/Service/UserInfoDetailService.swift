//
//  UserInfoDetailService.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import Foundation
import Alamofire

class UserInfoDetailService {
    func fetchUserInfoDeatil(userName: String, completion: @escaping (UserInfoDetail?) -> Void){
        let url = "\(Domain)/users/\(userName)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding:URLEncoding.default , headers: nil).responseJSON { (dataResponse) in
            if let data = dataResponse.data{
                guard let userInfoDetail = try? JSONDecoder().decode(UserInfoDetail.self, from: data) else{
                    print("Decode error!")
                    completion(nil)
                    return
                }
                completion(userInfoDetail)
            }
        }
    }
}
