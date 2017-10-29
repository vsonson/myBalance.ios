//
//  LoginViewModel.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import Foundation

import Foundation

protocol LoginViewModelProtocol {
    weak var delegate: LoginViewModelDelegate? { get set }
    
    var username: String { get }
    var password: String { get }
    var rememberMe: Bool? { get }
    var loginButtonPressed: Bool { get }
}

protocol LoginViewModelDelegate: class {
    func dismissKeyboard()
}

class LoginViewModel: LoginViewModelProtocol {
    
    var loginButtonPressed: Bool = false
    
    // MARK: Private properties
    
    private var login: LoginRequest
    
    
    weak var delegate: LoginViewModelDelegate?
    
    init (login: LoginRequest) {
        self.login = login
    }
    
    var username: String {
        return login.username
    }
    
    var rememberMe: Bool? {
        return login.rememberMe
    }
    
    var password: String {
        return login.password
    }
    
    // MARK: Actions
    
    func loginButtonPressed(errorMessage: String) {
        
    }
    
}
