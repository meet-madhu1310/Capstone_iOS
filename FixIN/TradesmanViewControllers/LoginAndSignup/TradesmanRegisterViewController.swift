//
//  TradesmanRegisterViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class TradesmanRegisterViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    var category: [CategoryList] = []
    let refTradesmen = Database.database().reference(withPath: "tradesmen")
    var data = [String: AnyObject]()
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    
//    var refTradesmen: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        
        //setting only bottom border
        fullNameTextField.setBottomBorder()
        emailAddressTextField.setBottomBorder()
        professionTextField.setBottomBorder()
        
        //when NEXT button is pressed
        fullNameTextField.delegate = self
        emailAddressTextField.delegate = self
        professionTextField.delegate = self
        
        self.hideKeyboard()
    }
    
    //MARK: - Move to next textFiled, NEXT is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case fullNameTextField:
            emailAddressTextField.becomeFirstResponder()
        case emailAddressTextField:
            professionTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    //Mark: Pushing to Firebase
    func addTradesman() {
        
        let categoryItem = CategoryList(fullname: fullNameTextField.text!, email: emailAddressTextField.text!, profession: professionTextField.text!)
        let categoryItemRef = self.refTradesmen.child(professionTextField.text!).childByAutoId()
        categoryItemRef.setValue(categoryItem.toAnyObject())
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        addTradesman()
        self.fullNameTextField.text = ""
        self.emailAddressTextField.text = ""
        self.professionTextField.text = ""
    }
    
}
