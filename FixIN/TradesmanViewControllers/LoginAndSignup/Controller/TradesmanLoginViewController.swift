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
    
    let tradesmanRef = Database.database().reference().child("tradesmen")
    
    
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
        let query = tradesmanRef.child("Carpenter").queryOrdered(byChild: "email").queryEqual(toValue: tradesmanEmailTextField.text)
        print("im query: ",query)
        query.observe(.value, with: { snapshot in
            if snapshot.exists() {
                self.performSegue(withIdentifier: "tradesman_loginTo_home_segue", sender: self)
            } else {
                let alertController = UIAlertController(title: "Something went wrong", message: "Please check your email address or password again.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        })
    }
    
}
