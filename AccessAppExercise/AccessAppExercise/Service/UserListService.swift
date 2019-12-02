//
//  UserListService.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import Foundation
import Alamofire
class UserListService {
    
    /// Fetch User List
    /// - Parameters:
    ///   - id: 從哪裡個id開始
    ///   - completion: call back
    func fetchUserList(id: String, completion: @escaping ([User]) -> Void){
        let url = "\(Domain)/users?since=\(id)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding:URLEncoding.default , headers: nil).responseJSON { (dataResponse) in
            if let data = dataResponse.data{
                guard let userList = try? JSONDecoder().decode([User].self, from: data) else{
                    print("Decode error!")
                    completion([])
                    return
                }
                completion(userList)
            }
        }
    }
}
