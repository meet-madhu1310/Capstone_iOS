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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
