//
//  ProfileViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-27.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

//Whatever you want to put here don't put here. This is just for menuDrawer so, menu can work properly. Put everything in MenuViewController.

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainVC = UIViewController()
        mainVC.view.backgroundColor = .white
        
        let rootController = RootViewController(mainViewController: mainVC, topNavigationRightImage: UIImage(named: "HamburgerMenu"))
        let menuVC = MenuViewController()
        menuVC.view.backgroundColor = UIColor.cyan
        
        let drawerVC = DrawerController(rootViewController: rootController, menuController: menuVC)
        
        self.addChild(drawerVC)
        view.addSubview(drawerVC.view)
        drawerVC.didMove(toParent: self)
    }
    
}