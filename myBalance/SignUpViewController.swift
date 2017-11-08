//
//  SignUpViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 10/29/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController, SignUpViewModelDelegate, UITextFieldDelegate {
    @IBOutlet var firstNameTextField: SkyFloatingLabelTextField!
    @IBOutlet var lastNameTextField: SkyFloatingLabelTextField!
    @IBOutlet var usernameTextField: SkyFloatingLabelTextField!
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var cancelButton: UIButton!

    var signUpViewModel: SignUpViewModel? {
        didSet {
            signUpViewModel?.delegate = self // Sets delegate to call functions from ViewModel
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
        registerButton.layer.cornerRadius = 6
        cancelButton.layer.cornerRadius = 6
        
        // Assigning delegate to view
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        // Initiate the view model with necessary user info
        signUpViewModel = SignUpViewModel(register: RegisterAccountRequest(username: usernameTextField.text!, password: passwordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!))
        
        // disable keyboard when touching background
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let registerAccountRequest = RegisterAccountRequest(username: username,
                                                            password: password,
                                                            firstName: firstName,
                                                            lastName: lastName)
        
        let alert = UIAlertController(title: "Success!", message: "You must verify your account and sign in.", preferredStyle: UIAlertControllerStyle.alert)
        //self.performSegue(withIdentifier: "registerSuccess", sender: self);
        
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler:  { action in self.performSegue(withIdentifier: "createAccount", sender: self) }))
        
        self.present(alert, animated: true, completion: nil)

//        if (username.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty)
//        {
//            showAlertViewControllers("Sign Up Failed!", errorMessage: "Please enter all fields!")
//        }
//        else{
//            
//            AccountResourceService.register(register: registerAccountRequest) { (success, json, error) in
//            if (success)
//            {
//                 let alert = UIAlertController(title: "Success!", message: "You must verify your account and sign in.", preferredStyle: UIAlertControllerStyle.alert)
//                //self.performSegue(withIdentifier: "registerSuccess", sender: self);
//                
//                alert.addAction(UIAlertAction(title:"OK", style: .default, handler:  { action in self.performSegue(withIdentifier: "registerSuccess", sender: self) }))
//                
//                self.present(alert, animated: true, completion: nil)
//
//                
//            }
//            else{
//                self.showAlertViewControllers("Sign Up Failed!", errorMessage: error!)
//            }
//            }
//            
//        }
        
        
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
