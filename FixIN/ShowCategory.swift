//
//  ShowCategory.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ShowCategory: UIViewController {

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
