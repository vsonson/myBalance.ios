//
//  SignUpViewModel.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation

protocol SignUpViewModelProtocol {
    weak var delegate: SignUpViewModelDelegate? { get set }
    var firstName: String { get }
    var lastName: String { get }
    var username: String { get }
    var password: String { get }
    var registerButtonPressed: Bool { get }
}

protocol SignUpViewModelDelegate: class {
    func dismissKeyboard()
}

class SignUpViewModel: SignUpViewModelProtocol {
    
    var registerButtonPressed: Bool = false
    
    // MARK: Private properties
    
    private var signUp: RegisterAccountRequest
    
    
    weak var delegate: SignUpViewModelDelegate?
    
    init (register: RegisterAccountRequest) {
        signUp = register
    }
    
    var firstName: String {
        return signUp.firstName!
    }

    var lastName: String {
        return signUp.lastName!
    }
    
    var username: String {
        return signUp.username
    }
    
    var password: String {
        return signUp.password
    }
    
    // MARK: Actions
    
    func registerButtonPressed(errorMessage: String) {
        
    }
    
}
