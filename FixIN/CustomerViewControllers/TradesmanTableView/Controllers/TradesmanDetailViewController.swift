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
    var tradesmanAvailibility: String!
    var tradesmanRate: String!
    
    @IBOutlet weak var tradesmanImageView: UIImageView!
    @IBOutlet var chatButton: UIButton!
    @IBOutlet var availibilityLabel: UILabel!
    @IBOutlet var tradesmanRateLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = tradesmanName
        tradesmanImageView.image = tradsmanImage
        availibilityLabel.text = tradesmanAvailibility
        tradesmanRateLabel.text = "$\(tradesmanRate!)"
        
        ///Rounded Tradesman Profile Image
        tradesmanImageView.layer.cornerRadius = tradesmanImageView.frame.width / 2
        tradesmanImageView.clipsToBounds = true
        
        ///Rounded Chat Button
        chatButton.layer.cornerRadius = 10.0
        chatButton.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    //MARK: - Navigation to ChatViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chat_segue" {
            let dvc = segue.destination as! ChatTradesmanViewController
            dvc.toTradesmanName = tradesmanName
        }
    }
    
    //MARK: - Go to ChatViewController
    @IBAction func chatButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "chat_segue", sender: self)
    }
    

}
