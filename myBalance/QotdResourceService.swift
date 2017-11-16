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


class QotdResourceService: ServiceBase {
    
    // Get the current quote of the day
    class func getQuoteOfDay(completionHandler: @escaping (Bool, QuoteOfTheDayResponse, String?) -> Void) {
        
        let url = "quote-of-the-days/current"
        
        ExecuteRequest(parameters: [:], requestType: .get, url: url) { (success, json, error) in
            if (success)
            {
                let id = json["id"].intValue
                let author = json["author"].stringValue
                let quoteText = json["quoteText"].string!
                var temp = QuoteOfTheDayResponse(author: author, id: id, quoteText: quoteText)
                completionHandler(true, temp, nil)
            }
            else{
                completionHandler(false, QuoteOfTheDayResponse.init(author: "", id: 0, quoteText: ""), nil)
            }
            
        }
    }
    
}
