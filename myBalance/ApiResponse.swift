//
//  ApiResponse.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
class ApiResponse {
    var success: Bool
    var message: String
    
    init (success: Bool, message: String) {
        self.success = success
        self.message = message
    }
}
