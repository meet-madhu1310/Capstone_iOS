//
//  LoginViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookLogin
import FacebookCore

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginButtonTapped: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        self.hideKeyboard()
        
        loginEmailTextField.setBottomBorder()
        loginPasswordTextField.setBottomBorder()
        loginButtonTapped.roundedBorder()
        
        loginEmailTextField.delegate = self
        loginPasswordTextField.delegate = self
        
        //Facebook Logit Button
        let loginButton = UIButton(type: .custom)
        loginButton.backgroundColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        loginButton.frame = CGRect(x: 80, y: 460, width: 250, height: 40)
        loginButton.setTitle("Continue with Facebook", for: .normal)
        loginButton.addTarget(self, action: #selector(loginFacebookButtonTapped), for: .touchUpInside)
        
        view.addSubview(loginButton)

    }
    
    //MARK: - Facebook Login Button Tapped
    @objc func loginFacebookButtonTapped() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) {
            loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login")
            case .success(grantedPermissions: let grantedPermission, declinedPermissions: let decilnedPermission, token: let accessToken):
                print("User logged in.")
                
                self.performSegue(withIdentifier: "loginTo_home_segue", sender: self)
            }
        }
    }
    
    //MARK: Keyboard Next Pressed - when user is on email textField and user press next on keyboard focus will move to password textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == loginEmailTextField {
            loginPasswordTextField.becomeFirstResponder()
        }

        return true
    }
    
    //MARK: Never Big Title
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginTo_home_segue" {
            segue.destination.navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    //MARK: Login Button Tapped
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: loginEmailTextField.text!, password: loginPasswordTextField.text!) {
            (user, error) in
            
            if self.loginEmailTextField.text == "" && self.loginPasswordTextField.text == "" {
                self.loginEmailTextField.becomeFirstResponder()
                
                let alertController = UIAlertController(title: "Error", message:"Please enter email address and password.", preferredStyle: .alert)
                let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(dafaultAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else if self.loginEmailTextField.text == "" {
                self.loginEmailTextField.becomeFirstResponder()
                
                let alertController = UIAlertController(title: "Error", message:"Please enter email address.", preferredStyle: .alert)
                let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(dafaultAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else if self.loginPasswordTextField.text == "" {
                self.loginPasswordTextField.becomeFirstResponder()
                
                let alertController = UIAlertController(title: "Error", message:"Please enter password.", preferredStyle: .alert)
                let dafaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(dafaultAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                self.performSegue(withIdentifier: "loginTo_home_segue", sender: self)
            }
        }
        
    }

}

extension UIButton {
    
    func roundedBorder() {
        self.frame = CGRect(x: 160, y: 100, width: 50, height: 40)
        self.layer.cornerRadius = 0.25 * self.bounds.size.width
        self.clipsToBounds = true
    }
    
}
