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
    
    
    
    class func authenticate(login: LoginRequest, completionHandler: @escaping (Bool, JSON, Error?) -> Void) {
        let parameters: Parameters = [
            "password": login.password,
            "username": login.username,
            ]
    
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/authenticate")

        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    //                  let jsonData = JSON(response.result.value!)  //unwrap the data (because it was optional) & use SwiftyJSON
                    let token = json["id_token"].string!
                    
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    appDelegate.tokenVal = token
                    
                    completionHandler(true, json, nil)
                    print("token: \(token)")
                    
                case .failure(let error):
                    completionHandler(false, nil, error)
                    
                    print(error)
                }
        }        
    }
    
}
