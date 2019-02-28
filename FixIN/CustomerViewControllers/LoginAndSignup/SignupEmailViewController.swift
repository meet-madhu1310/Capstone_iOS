//
//  SignupEmailViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-26.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupEmailViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var createButtonTapped: UIButton!
    
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        createButtonTapped.roundedBorder()
        
        //setting only bottom border
        emailAddressTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
        confirmPasswordTextField.setBottomBorder()

        //assign delegate so when user clicks on next on keyboard it goes to next textField
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self 
    }
    
    // MARK: - function to go to next textFiled through keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailAddressTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createTo_home_segue"{
            segue.destination.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    // MARK: - Sign Up method
    @IBAction func createButtonTapped(_ sender: Any) {
        
        if emailAddressTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
            
            let alertController = UIAlertController(title: "All fields required", message: "Please fill all fields.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            if passwordTextField.text != confirmPasswordTextField.text {
                let alertController = UIAlertController(title: "Incoorect password", message: "Please re-type your confirm password.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
        } else {
            
            Auth.auth().createUser(withEmail: emailAddressTextField.text!, password: passwordTextField.text!){ (user, error) in
                
                if error == nil {
                    self.performSegue(withIdentifier: "createTo_home_segue", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            
        }
        
    }
    

}
