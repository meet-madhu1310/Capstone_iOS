//
//  ReviewTradesmanViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-04-01.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ReviewTradesmanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Haha"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Hello"
    }
    
    @IBAction func crossItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
