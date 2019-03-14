//
//  ChatTradesmanViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-05.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ChatTradesmanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

}
