//
//  TradesmanRegisterViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class TradesmanRegisterViewController: UIViewController {
    
   
    @IBOutlet weak var tradesmanProfilePhoto: UIImageView!
    
    @IBOutlet weak var tradesmanFirstNameTextField: UITextField!
    @IBOutlet weak var tradesmanLastNameTextField: UITextField!
    @IBOutlet weak var tradesmanPhoneTextField: UITextField!
    @IBOutlet weak var tradesmanEmailTextField: UITextField!
    @IBOutlet weak var tradesmanPasswordTextField: UITextField!
    @IBOutlet weak var tradesmanConfirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tradesmanProfilePhoto.setRound()
        
        tradesmanFirstNameTextField.setBottomBorder()
        tradesmanLastNameTextField.setBottomBorder()
        tradesmanPhoneTextField.setBottomBorder()
        tradesmanEmailTextField.setBottomBorder()
        tradesmanPasswordTextField.setBottomBorder()
        tradesmanConfirmPasswordTextField.setBottomBorder()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func tradesmanCreateButtonTapped(_ sender: Any) {
        
//        if tradesmanPasswordTextField.text != tradesmanConfirmPasswordTextField.text {
//            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type your password", preferredStyle: .alert)
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//            alertController.addAction(defaultAction)
//            self.present(alertController, animated: true, completion: nil)
//        }
        if tradesmanEmailTextField.text == ""{
          
            let alertController = UIAlertController(title: "Email Address required", message: "Please enter email address.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().createUser(withEmail: tradesmanEmailTextField.text!, password: tradesmanPasswordTextField.text!) {
                (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "tradesmanCreateToHome_segue", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
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
