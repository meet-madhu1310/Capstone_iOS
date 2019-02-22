//
//  LoginViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEmailTextField.setBottomBorder()
        loginPasswordTextField.setBottomBorder()
        
        loginEmailTextField.becomeFirstResponder()
        
        loginEmailTextField.delegate = self
        loginPasswordTextField.delegate = self

    }
    
    @IBAction func itemBackTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backToHome_segue", sender: self)
        
    }
    
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
            
            self.performSegue(withIdentifier: "createAccount_segue", sender: self)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == loginEmailTextField {
            loginPasswordTextField.becomeFirstResponder()
        }

        return true
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if loginPasswordTextField.text == "" && loginEmailTextField.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter email address and password.", preferredStyle: .alert)
            let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(dafaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        if loginEmailTextField.text == "" {
            
            loginPasswordTextField.resignFirstResponder()
            loginEmailTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Error", message: "Please enter email address.", preferredStyle: .alert)
            let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(dafaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if loginPasswordTextField.text == "" {
            
            loginEmailTextField.resignFirstResponder()
            loginPasswordTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Error", message: "Please enter password.", preferredStyle: .alert)
            let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(dafaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        return false
        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: loginEmailTextField.text!, password: loginPasswordTextField.text!) {
            (user, error) in
            
             if error == nil {

                self.performSegue(withIdentifier: "loginTo_home_segue", sender: self)

            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
