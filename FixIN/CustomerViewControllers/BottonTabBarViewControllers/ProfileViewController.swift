//
//  ProfileViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-27.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

//Whatever you want to put here don't put here. This is just for menuDrawer so, menu can work properly. Put everything in MenuViewController.

import UIKit
import SideMenu

class ProfileViewController: UIViewController {
    
//    open var menuPresentMode: MenuPresentMode = .menuSlideIn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - SideMenu UI
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuShadowOpacity = 1.5
        SideMenuManager.default.menuShadowRadius = 25.0
    }
    
}
