//
//  MenuTradesmanProfileViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-20.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import SideMenu

class MenuTradesmanProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        
        guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBarView.backgroundColor = UIColor(red: 20.0/255.0, green: 25.0/255.0, blue: 45.0/255.0, alpha: 1.0)
    }

}
