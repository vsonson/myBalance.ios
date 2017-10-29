//
//  AuthenticateResponse.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation

class AuthenticateResponse {
    var id_token: String
    
    init (id_token: String) {
        self.id_token = id_token
    }
}
