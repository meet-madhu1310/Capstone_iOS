//
//  ChatWithCustomerViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-02.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ChatWithCustomerViewController: UIViewController {
    
    var customerName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = customerName
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}
