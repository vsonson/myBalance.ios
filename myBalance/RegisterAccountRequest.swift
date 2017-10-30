//
//  RegisterAccountRequest.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation

class RegisterAccountRequest {
    var username: String
    var password: String
    var firstName: String?
    var lastName: String?
    
    init (username: String, password: String, firstName: String?, lastName: String?) {
        self.username = username
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
    }
}
