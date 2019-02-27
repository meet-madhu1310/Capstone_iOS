//
//  TradesmanDetailViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-26.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class TradesmanDetailViewController: UIViewController {
    
    var tradesmanName: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = tradesmanName

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
