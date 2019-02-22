//
//  LoginViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEmailTextField.setBottomBorder()
        loginPasswordTextField.setBottomBorder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func itemBackTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backToHome_segue", sender: self)
        
    }
    
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
            
            self.performSegue(withIdentifier: "createAccount_segue", sender: self)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if loginEmailTextField.text == "" {
            
            
        } else {
            loginButtonTapped(shouldPerformSegue(withIdentifier: "loginTo_home_segue", sender: self))
        }
        
        return false
        
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: loginEmailTextField.text!, password: loginPasswordTextField.text!) {
            (user, error) in
            
             if error == nil {

//                self.performSegue(withIdentifier: "loginTo_home_segue", sender: self)

            } else{

                let alertController = UIAlertController(title: "Error", message: "Please enter email address and password.", preferredStyle: .alert)
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
