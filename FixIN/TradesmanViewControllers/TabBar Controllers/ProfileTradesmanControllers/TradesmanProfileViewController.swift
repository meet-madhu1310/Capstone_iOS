//
//  TradesmanProfileViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-28.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import SideMenu

class TradesmanProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        
        //MARK: - SideMenu UI
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuShadowOpacity = 1.5
        SideMenuManager.default.menuShadowRadius = 25.0
    }

}
