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

// Instantiate an API URL to return the JSON data
let restApiUrl = "http://localhost:8080/api/authenticate"

// Convert URL to NSURL
let url = URL(string: restApiUrl)

class UserJwtControllerService {
    
    
    
    class func authenticate(login: LoginRequest) -> ApiResponse {
        let parameters: Parameters = [
            "password": login.password,
            "username": login.username,
            ]
        
        var requestSuccess = false
        var msg = ""
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    //                  let jsonData = JSON(response.result.value!)  //unwrap the data (because it was optional) & use SwiftyJSON
                    let token = json["id_token"].string!
                    
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    appDelegate.tokenVal = token
                    
                    requestSuccess = true
                    print("found token")
                    
                case .failure(let error):
                    requestSuccess = false
                    msg = error.localizedDescription
                    
                    print(error)
                }
        }
        return ApiResponse(success: true, message: msg)
        
    }
    
}
