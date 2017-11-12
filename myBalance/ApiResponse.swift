//
//  ApiResponse.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApiResponse{
    var success: Bool
    var message: String
    var json: JSON
    
    init (success: Bool, message: String, json: JSON) {
        self.success = success
        self.message = message
        self.json = json
    }
}
