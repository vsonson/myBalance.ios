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
    
    class func register(register: RegisterAccountRequest) -> ApiResponse {
        let parameters: Parameters = [
            "password": register.password,
            "login": register.username,
            "firstName": register.firstName!,
            "lastName": register.lastName!
            ]
        
        var requestSuccess = false
        var msg = ""
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/register")
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    //                  let jsonData = JSON(response.result.value!)  //unwrap the data (because it was optional) & use SwiftyJSON
                    let statusCode = json["statusCode"].string!
                    
                    
                    requestSuccess = true
                    print("status: \(statusCode)")
                    
                case .failure(let error):
                    requestSuccess = false
                    msg = error.localizedDescription
                    
                    print(error)
                }
        }
        return ApiResponse(success: true, message: msg)
        
    }
    
}
