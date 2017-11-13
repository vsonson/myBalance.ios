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


class ThoughtOfDayService: ServiceBase {
    
    class func getThoughtOfDay(id: Int, completionHandler: @escaping (Bool, JSON, String?) -> Void) {
        let parameters: Parameters = [
            "id": id
        ]
        
        // Convert URL to NSURL
        let url = "thought-of-days"
        
        ExecuteRequest(parameters: parameters, requestType: .get, url: url) { (success, json, error) in
            if (success)
            {
                completionHandler(true, json, nil)
            }
            else{
                completionHandler(false, json, nil)
            }
            
        }
        
    }
    
}
