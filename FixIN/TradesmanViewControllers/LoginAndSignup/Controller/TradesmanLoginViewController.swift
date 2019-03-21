//
//  TradesmanLoginViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TradesmanLoginViewController: UIViewController {
    
    let tradesmanRef = Database.database().reference()
    
    
    @IBOutlet weak var tradesmanEmailTextField: UITextField!
    @IBOutlet weak var tradesmanPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        tradesmanEmailTextField.setBottomBorder()
        tradesmanPasswordTextField.setBottomBorder()
        
        self.hideKeyboard()

    }
    
    //MARK: Login Button Tapped
    @IBAction func loginButtonTapped(_ sender: Any) {
        tradesmanRef.child("tradesmen").observe(.value, with: { snapshot in
            for child in snapshot.children {
                print(child)
            }
        })
        
        self.performSegue(withIdentifier: "tradesman_loginTo_home_segue", sender: self)
    }
    
}
