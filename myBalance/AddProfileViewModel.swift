//
//  CreateAccountViewModel.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/6/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation

protocol AddProfileViewModelProtocol {
    weak var delegate: AddProfileViewModelDelegate? { get set }
    var gender: String { get }
    var yearInCollege: String { get }
    var dateOfBirth: String { get }
    var collegeDivision: String { get }
    var countryCode: String { get }
    var stateCode: String { get }
    var registerButtonPressed: Bool { get }
}

protocol AddProfileViewModelDelegate: class {
    func dismissKeyboard()
}

class AddProfileViewModel: AddProfileViewModelProtocol {
    var registerButtonPressed: Bool = false
    
    // MARK: Private properties
    
    private var profile: AddProfileRequest
    
    
    weak var delegate: AddProfileViewModelDelegate?
    
    init (profile: AddProfileRequest) {
        self.profile = profile
    }
    
    var gender: String {
        return profile.gender
    }
    
    var dateOfBirth: String {
        return profile.dateOfBirth
    }
    
    var yearInCollege: String {
        return profile.yearInCollege
    }
    
    var collegeDivision: String {
        return profile.collegeDivision
    }
    
    var countryCode: String {
        return profile.countryCode
    }
    
    var stateCode: String {
        return profile.stateCode
    }

    
    // MARK: Actions
    
    func registerButtonPressed(errorMessage: String) {
        
    }
    
}
