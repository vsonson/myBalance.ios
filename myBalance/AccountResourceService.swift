//
//  AccountResourceService.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class AccountResourceService: ServiceBase {
    
   class func register(register: RegisterAccountRequest, completionHandler: @escaping (Bool, String?) -> Void) {
        let parameters: Parameters = [
            "activated": true,
            "authorities": [
                    "user"
            ],
            "langKey": "EN",
            "password": register.password,
            "login": register.password,
            "email": register.username,
            "firstName": register.firstName!,
            "lastName": register.lastName!
            ]
    
    let url = URL(string: "http://localhost:8080/api/register")
    
    Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        .responseJSON { response in
            
            if let status = response.response?.statusCode {
                switch(status){
                case 201:
                    completionHandler(true, response.error as? String)
                case 400:
                    completionHandler(false, response.error as? String)
                    
                case 401:
                    completionHandler(false, response.error as? String)
                    
                    
                default:
                    //let error  = "Server Error!"
                    completionHandler(false, response.error as? String)
                }
            }
    }
    }
}
