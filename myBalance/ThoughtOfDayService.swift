//
//  ThoughtOfDayService.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/1/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class ThoughtOfDayService {
    
    func getThoughtOfDay(id: Int, completionHandler: @escaping (Bool, JSON, String?) -> Void) {
        let parameters: Parameters = [
            "id": id
        ]
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/thought-of-days/")
        
        Alamofire.request(url!, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                
                let json = JSON(response.result.value!)
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        completionHandler(true, json, nil)
                    case 401:
                        let error  = json["AuthenticationException"].string!
                        completionHandler(false, JSON.null, error)
                    case 404:
                        completionHandler(false, JSON.null, "Thought not found")
                    default:
                        let error  = "Server Error!"
                        completionHandler(false, JSON.null, error)
                    }
                }
        }
        
    }
    
}
