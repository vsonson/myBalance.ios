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



class UserJwtControllerService {
    
    
    
    class func authenticate(login: LoginRequest, completionHandler: @escaping (Bool, JSON, String?) -> Void) {
        let parameters: Parameters = [
            "password": login.password,
            "username": login.username,
            ]
    
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/authenticate")

        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                
                let json = JSON(response.result.value!)
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        completionHandler(true, json, nil)
                    case 400:
                        let error  = json["message"].string!
                        completionHandler(false, JSON.null, error)

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
