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
    var tradsmanImage: UIImage!
    @IBOutlet weak var tradesmanImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = tradesmanName
        tradesmanImageView.image = tradsmanImage
        
        tradesmanImageView.layer.cornerRadius = tradesmanImageView.frame.width / 2
        tradesmanImageView.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    @IBAction func chatButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "chat_segue", sender: self)
    }
    

}
