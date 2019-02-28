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
    @IBOutlet weak var loginButtonTapped: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        loginEmailTextField.setBottomBorder()
        loginPasswordTextField.setBottomBorder()
        loginButtonTapped.roundedBorder()
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginTo_home_segue" {
            segue.destination.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if loginPasswordTextField.text == "" && loginEmailTextField.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter email address and password.", preferredStyle: .alert)
            let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(dafaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        if loginEmailTextField.text == "" {
            
            loginEmailTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Error", message: "Please enter email address.", preferredStyle: .alert)
            let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(dafaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if loginPasswordTextField.text == "" {
            
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
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(dafaultAction)
                self.present(alertController, animated: true, completion: nil)
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

extension UIButton {
    
    func roundedBorder() {
        self.frame = CGRect(x: 160, y: 100, width: 50, height: 40)
        self.layer.cornerRadius = 0.25 * self.bounds.size.width
        self.clipsToBounds = true
    }
    
}
