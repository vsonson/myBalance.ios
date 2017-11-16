//
//  UserJwtControllerService.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



class UserJwtControllerService: ServiceBase {
    
    
    
    class func authenticate(login: LoginRequest, completionHandler: @escaping (Bool, String, String?) -> Void){
        let parameters: Parameters = [
            "password": login.password,
            "username": login.username,
            ]
    
        let url = URL(string: "http://localhost:8080/api/authenticate")
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let token = json["id_token"].string!
                    print("token: \(token)")

                    completionHandler(true, token, nil)
                    
                case .failure(let error):
                    completionHandler(false, "", error as? String)
                    
                    print(error)
                }
        }        

    }
    
}
