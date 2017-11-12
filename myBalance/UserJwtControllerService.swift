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
    
    
    
    class func authenticate(login: LoginRequest, completionHandler: @escaping (Bool, JSON, String?) -> Void){
        let parameters: Parameters = [
            "password": login.password,
            "username": login.username,
            ]
    
        
        // Convert URL to NSURL
        let url = "authenticate"
        
        ExecuteRequest(parameters: parameters, requestType: .post, url: url) { (success, json, error) in
            if (success)
            {
                completionHandler(true, json, nil)
            }
            else{
               completionHandler(false, json, nil)
            }
            
        }
        //return ApiResponse(success: successStatus, message: msg, json: jsonResponse)

    }
    
}
