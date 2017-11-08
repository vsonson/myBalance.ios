//
//  CreateAccountRequest.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/6/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation
class AddProfileRequest {
    var dateOfBirth: String
    var gender: String
    var yearInCollege: String
    var collegeDivision: String
    var countryCode: String
    var stateCode: String
    
    init (dateOfBirth: String,
        gender: String,
        collegeYear: String,
        collegeDivision: String,
        country: String,
        state: String) {
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.yearInCollege = collegeYear
        self.collegeDivision = collegeDivision
        self.countryCode = country
        self.stateCode = state
    }
}
