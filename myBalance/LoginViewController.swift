//
//  LoginViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController, LoginViewModelDelegate, UITextFieldDelegate {
    
    @IBOutlet var usernameTextField: SkyFloatingLabelTextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var facebookButton: UIView!
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!
    private var isLoginButtonPressed = false
    
    var loginViewModel: LoginViewModel? {
        didSet {
            loginViewModel?.delegate = self // Sets delegate to call functions from ViewModel
        }
    }
    
    struct Auth {
        
        var idToken: String
        
        init(idToken: String) {
            self.idToken = idToken
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add round edges to buttons
        loginButton.layer.cornerRadius = 6
        facebookButton.layer.cornerRadius = 6
        
        // Assigning delegate to view
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        // Initiate the view model with necessary user info
        loginViewModel = LoginViewModel(login: LoginRequest(username: usernameTextField.text!, password: passwordTextField.text!, rememberMe: (false)))
        
        // disable keyboard when touching background
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let loginRequest = LoginRequest(username: username,
                                        password: password,
                                        rememberMe: false)
        isLoginButtonPressed = true
        
        if (username.isEmpty || password.isEmpty)
        {
            showAlertViewControllers("Sign in Failed!", errorMessage: "Please enter your username and password!")
        }
        else{
            
            UserJwtControllerService.authenticate(login: loginRequest) { (success, token, error) in
                if (success)
                {
                    //store the auth token
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.tokenVal = token
                    
                    // check if new quote is available
                    QotdResourceService.NewQuoteAvailable() { (success, showQuote, error) in
                    if (success) {
                        if (showQuote){
                            self.performSegue(withIdentifier: "showQotd", sender: self);
                        }
                    }

                    self.performSegue(withIdentifier: "skipQotd", sender: self);
                    }
                    
                }
                else{
                    self.showAlertViewControllers("Sign in Failed!", errorMessage: error as! String)
                }

            }
            
        }
        
        
        
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /*
     This method uses UIAlertController class to show a dialog box upon user interaction.
     */
    func showAlertViewControllers(_ titleOfError: String, errorMessage: String)
    {
        /*
         Create a UIAlertController object; dress it up with title, message, and preferred style;
         and store its object reference into local constant alertController
         */
        let alertController = UIAlertController(title: titleOfError, message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        // Create a UIAlertAction object and add it to the alert controller
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // Present the alert controller by calling the presentViewController method
        self.present(alertController, animated: true, completion: nil)
        
    }
}
