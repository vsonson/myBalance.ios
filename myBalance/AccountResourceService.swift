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
        
    Register(parameters: parameters) { (success, json, error) in
        if (success)
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.tokenVal = json["id_token"].string!
            completionHandler(true, json, nil)
        }
        else{
            completionHandler(false, json, nil)
        }
        
    }
        
    }
    
}
