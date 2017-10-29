//
//  LoginRequest.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation

class LoginRequest {
    var username: String
    var password: String
    var rememberMe: Bool?
    
    init (username: String, password: String, rememberMe: Bool?) {
        self.username = username
        self.password = password
        self.rememberMe = rememberMe;
    }
}
