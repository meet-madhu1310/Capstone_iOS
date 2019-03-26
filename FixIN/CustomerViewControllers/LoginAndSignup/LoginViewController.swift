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

import SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var name: String!
    var profilePicture: UIImage!

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginButtonTapped: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
//        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.hideKeyboard()
        
        loginEmailTextField.setBottomBorder()
        loginPasswordTextField.setBottomBorder()
        loginButtonTapped.roundedBorder()
        
        loginEmailTextField.delegate = self
        loginPasswordTextField.delegate = self
        
        //Facebook Logit Button
        let loginButton = UIButton(type: .custom)
        loginButton.backgroundColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        loginButton.frame = CGRect(x: 40, y: 460, width: 335, height: 40)
        loginButton.setTitle("Continue with Facebook", for: .normal)
        loginButton.addTarget(self, action: #selector(loginFacebookButtonTapped), for: .touchUpInside)
        loginButton.layer.cornerRadius = 0.04 * loginButton.bounds.size.width

        view.addSubview(loginButton)
        
    }
    
    //MARK: - Fetch FBUser
//    fileprivate func fetchFacebookUser() {
//        let graphRequestConnection = GraphRequestConnection()
//        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, name, picture.type(large)"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: .defaultVersion)
//        
//        graphRequestConnection.add(graphRequest) { (httpResponse, result) in
//            switch result {
//            case .success(response: let response):
//                guard let responseDictionary = response.dictionaryValue else { return }
//                let json = JSON(responseDictionary)
//                self.name = json["name"].string
//                
//                guard let profilePictureUrl = json["picture"]["data"]["url"].string, let url = URL(string: profilePictureUrl) else { return }
//                
//                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//                    if let error = error {
//                        print(error)
//                        return
//                    }
//                    
//                    guard let data = data else { return }
//                    self.profilePicture = UIImage(data: data)
//                    print(self.profilePicture)
//                    
//                }).resume()
//                break
//                
//            case .failed(let error):
//                print("Failed here in graph request:", error)
//                break
//            }
//        }
//        
//        graphRequestConnection.start()
//    }
    
    
    //MARK: - Facebook Login Button Tapped
    @objc func loginFacebookButtonTapped() {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile], viewController: self) {
            loginResult in
            switch loginResult {
            case .failed(let error):
                print("Failed here when button tapped:",error)
            case .cancelled:
                print("User cancelled login")
            case .success(grantedPermissions: let grantedPermission, declinedPermissions: let decilnedPermission, token: let accessToken):
                print("User logged in.")

                self.performSegue(withIdentifier: "loginTo_home_segue", sender: self)
            }
        }
    }
    
    //MARK: Keyboard Next Pressed
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
