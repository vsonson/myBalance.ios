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



class UserInfoResourceService {
    
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
        
        // Convert URL to NSURL
        let url = URL(string: "http://localhost:8080/api/user-infos")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer \(appDelegate.tokenVal)"
        ]
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseString { response in
                
                let json = JSON(response.result.value!)
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
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
