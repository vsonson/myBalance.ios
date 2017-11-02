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
    
    
//    open func dataTask(with request: URLRequest,
//                       completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void)
//        -> URLSessionDataTask {
//            // make an URL request
//            // wait for results
//            // check for errors and stuff
//            completionHandler(data, response, error)
//            // return the data task
//    }
    
    
//    "activated": true,
//    "authorities": [
//    "user"
//    ],
//    "createdBy": "string",
//    "createdDate": "2017-11-02T02:02:58.528Z",
//    "email": "mogg.andrew@gmail.com",
//    "firstName": "Andrew",
//    "langKey": "EN",
//    "lastName": "Mogg",
//    "login": "mogg",
//    "password": "mogg"
    
    class func register(register: RegisterAccountRequest, completionHandler: @escaping (Bool, JSON) -> Void) {
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
                        completionHandler(true, json)
                    default:
                        completionHandler(false, json)
                        
                        //print(error)
                    }
                }
                
//                switch response.result {
//                case .success(let value):
//                    let json = JSON(value)
//                    
//                    //                  let jsonData = JSON(response.result.value!)  //unwrap the data (because it was optional) & use SwiftyJSON
//                    //let statusCode = json["statusCode"].string!
//                    
//                            
//                    completionHandler(true, json, nil)
//                   // print("status: \(statusCode)")
//                    
//                case .failure(let error):
//                    completionHandler(false, JSON.null, error)
//
//                    print(error)
//                }
        }
        
    }
    
}
