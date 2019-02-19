//
//  TradesmanListViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class TradesmanListViewController: UIViewController {

    @IBOutlet weak var tradesmanTitleLabel: UILabel!
    var detailLabelString: String?
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    @IBOutlet weak var backButtonTapped: UIBarButtonItem!
    
    var menuIsVisible = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let titleText = detailLabelString {
            tradesmanTitleLabel.text = titleText
        } else {
            tradesmanTitleLabel.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
