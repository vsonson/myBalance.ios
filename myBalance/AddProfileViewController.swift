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
    
    @IBAction func finishProfileButtonTapped(_ sender: Any) {
        //grab the textfield values
        let dob = dateOfBirthTextField.text!
        let gender = genderTextField.text!
        let collegeYear = yearInCollegeTextField.text!
        let collegeDivision = collegeDivisionTextField.text!
        let country = countryCodeTextField.text!
        let state = stateCodeTextField.text!
        
        let userInfoRequest = UserInfoRequest(dateOfBirth: dob, gender: gender, collegeYear: collegeYear, collegeDivision: collegeDivision, country: country, state: state)
        
        if (dob.isEmpty || gender.isEmpty || collegeYear.isEmpty || collegeDivision.isEmpty || country.isEmpty || state.isEmpty )
        {
            showAlertViewControllers("Sign Up Failed!", errorMessage: "Please enter all fields!")
        }
        else{

            UserInfoResourceService.userInfo(userInfo: userInfoRequest) { (success, json, error) in
            if (success)
            {
                 let alert = UIAlertController(title: "Success!", message: "Profile Updated.", preferredStyle: UIAlertControllerStyle.alert)
                //self.performSegue(withIdentifier: "registerSuccess", sender: self);

                alert.addAction(UIAlertAction(title:"OK", style: .default, handler:  { action in self.performSegue(withIdentifier: "createAccountSuccess", sender: self) }))

                self.present(alert, animated: true, completion: nil)


            }
            else{
                self.showAlertViewControllers("Profile Update Failed!", errorMessage: error!)
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
    
    // MARK: TextField Delegate
    @objc func datePickerChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        dateOfBirthTextField.text = formatter.string(from: sender.date)
            }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if (textField.tag == 1) {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date;
            dateOfBirthTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        }

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.tag == 1) {
            textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: Helper Methods
    func closekeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }

    
}
