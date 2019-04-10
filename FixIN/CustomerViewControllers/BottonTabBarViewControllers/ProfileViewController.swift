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
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailValueLabel: UILabel!
    @IBOutlet var activeBookingValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - SideMenu UI
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuShadowOpacity = 1.5
        SideMenuManager.default.menuShadowRadius = 25.0
        
        ///ROUND Profile Image
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        
        nameLabel.text = "Meet Madhu"
        emailValueLabel.text = "meetmadhu123@gmail.com"
        activeBookingValueLabel.text = "2"
    }
    
}
