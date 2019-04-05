//
//  ReviewTradesmanViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-04-01.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ReviewTradesmanViewController: UIViewController {

    @IBOutlet var reviewTradesmanImage: UIImageView!
    @IBOutlet var tradesmanNameLabel: UILabel!
    var selectedTradesman: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = selectedTradesman {
            print("Tradesman Name: ",selectedTradesman as Any)
            tradesmanNameLabel.text = "How did you like \(name)'s work?"
        } else {
            tradesmanNameLabel.text = "Can't fetch Tradesman's name."
        }
    }
    
    //MARK: Stop Item Tapped
    @IBAction func crossItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
