//
//  CreateAccountViewController.swift
//  myBalance
//
//  Created by Andrew Mogg on 11/5/17.
//  Copyright © 2017 Andrew Mogg. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class AddProfileViewController: UIViewController, AddProfileViewModelDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var dateOfBirthTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var genderTextField: SkyFloatingLabelTextField!
    @IBOutlet var yearInCollegeTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var collegeDivisionTextField: SkyFloatingLabelTextField!
    
    @IBOutlet var stateCodeTextField: SkyFloatingLabelTextField!
    @IBOutlet var countryCodeTextField: SkyFloatingLabelTextField!
    
    //picker view data
    let genderPicker = UIPickerView()
    let yearInCollegePicker = UIPickerView()
    let divisionPicker = UIPickerView()
    let statePicker = UIPickerView()
    let countryPicker = UIPickerView()
    var PickerData = [String]()
    var selectedTextField: UITextField = UITextField()


    var addProfileViewModel: AddProfileViewModel? {
        didSet {
            addProfileViewModel?.delegate = self // Sets delegate to call functions from ViewModel
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize pickers
        genderPicker.delegate = self
        yearInCollegePicker.delegate = self
        divisionPicker.delegate = self
        statePicker.delegate = self
        countryPicker.delegate = self
        
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
    
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if (textField.tag == 1) {
            self.selectedTextField = textField
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date;
            dateOfBirthTextField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
        }
        
        if (textField.tag == 2) {
            self.selectedTextField = textField
            PickerData.removeAll()
            PickerData = ["Male", "Female", "Non-binary"]
            genderTextField.inputView = genderPicker
        }
        
        if (textField.tag == 3) {
            self.selectedTextField = textField
            PickerData.removeAll()
            PickerData = ["Freshman", "Sophomore", "Junior", "Senior", "5th Year", "Grad. Student"]
            yearInCollegeTextField.inputView = yearInCollegePicker
        }
        
        if (textField.tag == 4) {
            self.selectedTextField = textField
            PickerData.removeAll()
            PickerData = ["I", "II", "III", "Club"]
            collegeDivisionTextField.inputView = divisionPicker
        }
        
        if (textField.tag == 5) {
            self.selectedTextField = textField
            PickerData.removeAll()
            PickerData = [ "AK",
                           "AL",
                           "AR",
                           "AS",
                           "AZ",
                           "CA",
                           "CO",
                           "CT",
                           "DC",
                           "DE",
                           "FL",
                           "GA",
                           "GU",
                           "HI",
                           "IA",
                           "ID",
                           "IL",
                           "IN",
                           "KS",
                           "KY",
                           "LA",
                           "MA",
                           "MD",
                           "ME",
                           "MI",
                           "MN",
                           "MO",
                           "MS",
                           "MT",
                           "NC",
                           "ND",
                           "NE",
                           "NH",
                           "NJ",
                           "NM",
                           "NV",
                           "NY",
                           "OH",
                           "OK",
                           "OR",
                           "PA",
                           "PR",
                           "RI",
                           "SC",
                           "SD",
                           "TN",
                           "TX",
                           "UT",
                           "VA",
                           "VI",
                           "VT",
                           "WA",
                           "WI",
                           "WV",
                           "WY"]
            stateCodeTextField.inputView = statePicker
        }

        
        if (textField.tag == 6) {
            self.selectedTextField = textField
            PickerData.removeAll()
            PickerData = ["US", "CA"]
            countryCodeTextField.inputView = countryPicker
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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
    
    // MARK: UIPickerView Delegation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerData.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerData[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (selectedTextField.tag == 2) {
            genderTextField.text = PickerData[row]

        }
        if (selectedTextField.tag == 3) {
            yearInCollegeTextField.text = PickerData[row]
        }
        if (selectedTextField.tag == 4) {
            collegeDivisionTextField.text = PickerData[row]
            
        }
        if (selectedTextField.tag == 5) {
            stateCodeTextField.text = PickerData[row]
        }
        if (selectedTextField.tag == 6) {
            countryCodeTextField.text = PickerData[row]
            
        }
    }

    
}
