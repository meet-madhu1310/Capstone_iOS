//
//  RegisterViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var refUser: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting reference to database
        refUser = Database.database().reference().child("users")
        
        //setting bottom border for textFields and round profile photo
        profileImage.setRound()
        firstNameTextField.setBottomBorder()
        lastNameTextField.setBottomBorder()
        phoneNumberTextField.setBottomBorder()
        emailAddressTextField.setBottomBorder()
        passwordTextField.setBottomBorder()
        confirmPasswordTextField.setBottomBorder()
        
        
        //focus and re-fcous on particular textField
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
    
    //function to push data to Firebase
    func addUser() {
        
        let user = [
            "FirstName": firstNameTextField.text! as String,
            "LastName": lastNameTextField.text! as String,
            "PhoneNumber": phoneNumberTextField.text! as String,
            "EmailAddress": emailAddressTextField.text! as String,
            "Password": passwordTextField.text! as String,
            "ConfirmPassword": confirmPasswordTextField.text! as String
        ]
        
        refUser.childByAutoId().setValue(user)
        
    }
    
    
    @IBAction func createButtonTapped(_ sender: Any) {
        
        if firstNameTextField.text == "" {
            
            firstNameTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "First Name", message: "Please enter your first name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if lastNameTextField.text == "" {
            lastNameTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Last Name", message: "Please enter your last name.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if phoneNumberTextField.text == "" {
            phoneNumberTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Phone Number", message: "Please enter your phone number.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if emailAddressTextField.text == "" {
            emailAddressTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Email Address", message: "Please enter your email address.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if passwordTextField.text == "" {
            passwordTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Password", message: "Please enter your password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if confirmPasswordTextField.text == "" {
            confirmPasswordTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Confirm Password", message: "Please enter your confirm password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if passwordTextField.text != confirmPasswordTextField.text {
            confirmPasswordTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Password does't match", message: "Please re-type your confirm password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            addUser()
            getUser()
        }
        
    }
    
    //it is giving you first names of all the users you have. you might wannna use it to display tradesman name and last name as giving all the table entries
    func getUser() {
        
//        let userID = Auth.auth().currentUser?.uid
        
        self.refUser.observe(DataEventType.childAdded) {
            (snapshot: DataSnapshot) in
            
            let value = snapshot.value as? NSDictionary
            let username = value?["FirstName"] as? String
            
            print(username!)
//            print(userID!)
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
