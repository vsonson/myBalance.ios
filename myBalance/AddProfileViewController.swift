//
//  CreateAccountViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/5/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class AddProfileViewController: UIViewController, AddProfileViewModelDelegate, UITextFieldDelegate {
    
    @IBOutlet var dateOfBirthTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var genderTextField: SkyFloatingLabelTextField!
    @IBOutlet var yearInCollegeTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var collegeDivisionTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var stateCodeTextField: SkyFloatingLabelTextField!
    @IBOutlet var countryCodeTextField: SkyFloatingLabelTextField!
    var addProfileViewModel: AddProfileViewModel? {
        didSet {
            addProfileViewModel?.delegate = self // Sets delegate to call functions from ViewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addProfileViewModel = AddProfileViewModel(profile: AddProfileRequest(dateOfBirth: dateOfBirthTextField.text!, gender: genderTextField.text!, collegeYear: yearInCollegeTextField.text!, collegeDivision: collegeDivisionTextField.text!, country: countryCodeTextField.text!, state: stateCodeTextField.text!))
        
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
