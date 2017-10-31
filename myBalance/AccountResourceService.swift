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
    
    class func register(register: RegisterAccountRequest, completionHandler: @escaping (Bool, JSON, Error?) -> Void) {
        let parameters: Parameters = [
            "password": register.password,
            "login": register.username,
            "firstName": register.firstName!,
            "lastName": register.lastName!
            ]
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/register")
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    
                    //                  let jsonData = JSON(response.result.value!)  //unwrap the data (because it was optional) & use SwiftyJSON
                    //let statusCode = json["statusCode"].string!
                    
                            
                    completionHandler(true, json, nil)
                   // print("status: \(statusCode)")
                    
                case .failure(let error):
                    completionHandler(false, nil, error)

                    print(error)
                }
        }
        
    }
    
}
