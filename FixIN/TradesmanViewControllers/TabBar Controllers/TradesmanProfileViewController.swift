//
//  TradesmanProfileViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-28.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class TradesmanProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mainVC = UIViewController()
        mainVC.view.backgroundColor = .white
        
        let rootController = RootViewController(mainViewController: mainVC, topNavigationRightImage: UIImage(named: "HamburgerMenu"))
        let menuVC = MenuViewController()
        menuVC.view.backgroundColor = UIColor(red: 20.0/255.0, green: 25.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        
        let drawerVC = DrawerController(rootViewController: rootController, menuController: menuVC)
        
        self.addChild(drawerVC)
        view.addSubview(drawerVC.view)
        drawerVC.didMove(toParent: self)
    }

}
