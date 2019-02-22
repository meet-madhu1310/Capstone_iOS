//
//  ShowCategory.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ShowCategory: UIViewController {
    
    
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    
    var menuIsVisible = false
    var backButtonIsVisible = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plumberButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "plumber_segue", sender: self)
    }
    
    
    @IBAction func mechanicButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "mechanic_segue", sender: self)
    }
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        
        if !menuIsVisible {
            leadingC.constant = 200
            
            trailingC.constant = 0
            menuIsVisible = true
            
        } else {
            leadingC.constant = 0
            trailingC.constant = 0
            
            menuIsVisible = false
        }
        
        UIView.animate( withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {self.view.layoutIfNeeded()} )
        
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
        let title = NSLocalizedString("Are you sure?", comment: "")
        let yesButton = NSLocalizedString("Yes", comment: "")
        let cancelButton = NSLocalizedString("No", comment: "")
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: NSLocalizedString(yesButton, comment: ""), style: .default) { _ in
            
            do {
                try Auth.auth().signOut()
                
                self.performSegue(withIdentifier: "categoryLogoutTo_home_segue", sender: self)
                
            }
            catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
        })
        
        alertController.addAction(UIAlertAction(title: NSLocalizedString(cancelButton, comment: ""), style: .cancel) { _ in})
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "plumber_segue" {
            let dvc = segue.destination as! TradesmanListViewController
            dvc.detailLabelString = "Plumber"
        } else if segue.identifier == "mechanic_segue" {
            let dvc = segue.destination as! TradesmanListViewController
            dvc.detailLabelString = "Mechanic"
        }
    }
    

}
