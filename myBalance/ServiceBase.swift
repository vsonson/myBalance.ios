//
//  ServiceBase.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/11/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ServiceBase {
    
    class func ExecuteRequest(parameters: Parameters,
                        requestType: HTTPMethod,
                        url: String,
                        completionHandler: @escaping (Bool, JSON, String?) -> Void) {
        
        let url = URL(string: "http://localhost:8080/api/" + url)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer \(appDelegate.tokenVal)"
        ]
        
        Alamofire.request(url!, method: requestType, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON{ response in
                
                let json = JSON(response.result.value!)
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
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
