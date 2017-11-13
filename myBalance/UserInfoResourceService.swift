//
//  UserInfoResourceService.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/8/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



class UserInfoResourceService: ServiceBase {
    
    class func userInfo(userInfo: UserInfoRequest, completionHandler: @escaping (Bool, JSON, String?) -> Void) {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yy"
        
        let date = dateFormatter.date(from: userInfo.dateOfBirth)
        
        let dateMilliSeconds = Int64((date?.timeIntervalSince1970)!*1000)
        
        let parameters: Parameters = [
            "collegeDivision": userInfo.collegeDivision,
            "country": userInfo.countryCode,
            "countryCode": userInfo.countryCode,
            "dateOfBirth": dateMilliSeconds,
            "gender": userInfo.gender,
            "state": userInfo.stateCode,
            "stateCode": userInfo.stateCode,
            "yearInCollege": userInfo.yearInCollege,
        ]
        
        let url = "user-infos"
        
        ExecuteRequest(parameters: parameters, requestType: .post, url: url) { (success, json, error) in
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
