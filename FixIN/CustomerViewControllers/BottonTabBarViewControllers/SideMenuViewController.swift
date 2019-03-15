//
//  SideMenuViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-14.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import SideMenu
import FirebaseAuth

class SideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        
        guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBarView.backgroundColor = UIColor(red: 20.0/255.0, green: 25.0/255.0, blue: 45.0/255.0, alpha: 1.0)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customer_logout_segue" {
            segue.destination.navigationItem.setHidesBackButton(true, animated: false)
        }
    }

    //MARK: - Logout Button Tapped
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let title = NSLocalizedString("Are you sure?", comment: "")
        let yesButton = NSLocalizedString("Yes", comment: "")
        let cancelButton = NSLocalizedString("No", comment: "")
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: NSLocalizedString(yesButton, comment: ""), style: .default) { _ in
            
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "customer_logout_segue", sender: self)
            }
            catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
        })
        alertController.addAction(UIAlertAction(title: NSLocalizedString(cancelButton, comment: ""), style: .cancel) { _ in})
        self.present(alertController, animated: true, completion: nil)
    }
}
