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

class TradesmanRegisterViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    
    var refTradesmen: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        
        //setting up reference to Firebase Database
        refTradesmen = Database.database().reference()
        
        //setting only bottom border
        fullNameTextField.setBottomBorder()
        emailAddressTextField.setBottomBorder()
        professionTextField.setBottomBorder()
    }
    
    //Mark: Pushing to Firebase
    func addTradesman() {
        
        let tradesman = [
            "FullName": fullNameTextField.text! as String,
            "EmailAddress": emailAddressTextField.text! as String,
            "Profession": professionTextField.text! as String
        ]
        
        refTradesmen.child("tradesmen").child("/\(professionTextField.text!)").setValue(tradesman)
        
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        addTradesman()
    }
    
}
