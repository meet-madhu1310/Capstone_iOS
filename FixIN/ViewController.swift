//
//  ViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-08.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - If user already logged in then redirect to home
    override func viewWillAppear(_ animated: Bool) {
//        if Auth.auth().currentUser != nil {
//            self.performSegue(withIdentifier: "direct_home_segue", sender: self)
//        }
    }
    
}

extension UIViewController {
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

