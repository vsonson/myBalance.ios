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


class AccountResourceService {
    
   class func register(register: RegisterAccountRequest, completionHandler: @escaping (Bool, JSON, String?) -> Void) {
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
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/register")
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                
                let json = JSON(response.result.value!)
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        completionHandler(true, json, nil)
                    case 400:
                        completionHandler(false, JSON.null, json.rawString())
                        
                    case 401:
                        let error  = json["AuthenticationException"].string!
                        completionHandler(false, JSON.null, error)
                        
                        
                    default:
                        let error  = "Server Error!"
                        completionHandler(false, JSON.null, error)
                    }
                }
        }
        
    }
    
}
