//
//  MenuViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-27.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let settingsButton = UIButton(frame: CGRect(x: 40, y: 200, width: 200, height: 40))
    let logoutButton = UIButton(frame: CGRect(x: 40, y: 600, width: 200, height: 40))
    let bookingsButton = UIButton(frame: CGRect(x: 40, y: 240, width: 200, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //all button functions call
        settingsButtonFunc()
        logoutButtonFunc()
        bookingsButtonFunc()
        
        //initially hide all the buttons
        settingsButton.isHidden = true
        logoutButton.isHidden = true
        bookingsButton.isHidden = true
    }
    
    func settingsButtonFunc() {
        settingsButton.backgroundColor = .clear
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(UIColor.white, for: .normal)
        settingsButton.titleLabel?.font = UIFont(name: "System Font", size: 30.0)
        view.addSubview(settingsButton)
    }
    
    func logoutButtonFunc() {
        logoutButton.backgroundColor = .clear
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(UIColor.white, for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "System Font", size: 30.0)
        
//        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        view.addSubview(logoutButton)
    }
    
//    @objc func logoutButtonTapped() {
//        self.performSegue(withIdentifier: "logout_button_segue", sender: self)
//    }
    
    func bookingsButtonFunc() {
        bookingsButton.backgroundColor = .clear
        bookingsButton.setTitle("Bookings", for: .normal)
        bookingsButton.setTitleColor(UIColor.white, for: .normal)
        bookingsButton.titleLabel?.font = UIFont(name: "System Font", size: 30.0)
        view.addSubview(bookingsButton)
    }

}
