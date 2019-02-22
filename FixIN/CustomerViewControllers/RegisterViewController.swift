//
//  RegisterViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.setRound()
        firstNameTextField.setBottomBorder()
        lastNameTextField.setBottomBorder()
        phoneNumberTextField.setBottomBorder()
        emailAddressTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
        confirmPasswordTextField.setBottomBorder()
        
        firstNameTextField.becomeFirstResponder()

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneNumberTextField.delegate = self
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
            
        case lastNameTextField:
            phoneNumberTextField.becomeFirstResponder()
            
        case phoneNumberTextField:
            emailAddressTextField.becomeFirstResponder()
            
        case emailAddressTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return false
        
    }
    
    
    @IBAction func createButtonTapped(_ sender: Any) {
        
//        var fName = firstNameTextField.text
//        var lName = lastNameTextField.text
//        var phone = phoneNumberTextField.text
        
        
        if passwordTextField.text != confirmPasswordTextField.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type your password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            
            Auth.auth().createUser(withEmail: emailAddressTextField.text!, password: passwordTextField.text!) {
                (user, error) in
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

extension UIImageView {
    
    func setRound() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    
}

extension UITextField {
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
