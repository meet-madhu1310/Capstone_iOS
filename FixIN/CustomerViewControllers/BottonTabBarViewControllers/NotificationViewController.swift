//
//  NotificationViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-05.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet var notificationSegmentSwitch: UISegmentedControl!
    @IBOutlet var notificationTableView: UITableView!
    
    ///For index one - SEGEMENTED SWITCH
    var tradespersonNamesIndexOne = ["Morgun Benzies", "Terra Carlyon", "Jessamine Dearl", "Holly Anne", "Anatol Midner"]
    var tradespersonImagesIndexOne: [UIImage] = [
        UIImage(named: "Sim")!,
        UIImage(named: "Smith")!,
        UIImage(named: "Dani")!,
        UIImage(named: "Emma")!,
        UIImage(named: "John")!
    ]
    
    ///For index two - SEGEMENTED SWITCH
    var tradespersonNamesIndexTwo = ["Morgun Benzies", "Terra Carlyon", "Jessamine Dearl", "Anatol Midner", "Holly Anne"]
    var tradespersonImagesIndexTwo: [UIImage] = [
        UIImage(named: "Sim")!,
        UIImage(named: "Smith")!,
        UIImage(named: "Dani")!,
        UIImage(named: "Emma")!,
        UIImage(named: "John")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        notificationTableView.reloadData()
    }
    
}

extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let index = self.notificationSegmentSwitch.selectedSegmentIndex
        
        if index == 0 {
            return tradespersonNamesIndexOne.count
        } else {
            return tradespersonNamesIndexTwo.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tradespersonNameIndexOne = tradespersonNamesIndexOne[indexPath.row]
        let tradespersonImageIndexOne = tradespersonImagesIndexOne[indexPath.row]
        
        let tradespersonNameIndexTwo = tradespersonNamesIndexTwo[indexPath.row]
        let tradespersonImageIndexTwo = tradespersonImagesIndexTwo[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as? NotificationTableViewCell {
            
            let index = self.notificationSegmentSwitch.selectedSegmentIndex
            
            if index == 0 {
                cell.tradespersonNameLabel.text = tradespersonNameIndexOne
                cell.tradespersonImageView.image = tradespersonImageIndexOne
                
                cell.tradespersonImageView.layer.cornerRadius = cell.tradespersonImageView.frame.width / 2
                cell.tradespersonImageView.clipsToBounds = true
                
                return cell
            } else {
                cell.tradespersonNameLabel.text = tradespersonNameIndexTwo
                cell.tradespersonImageView.image = tradespersonImageIndexTwo
                
                cell.tradespersonImageView.layer.cornerRadius = cell.tradespersonImageView.frame.width / 2
                cell.tradespersonImageView.clipsToBounds = true
                
                return cell
            }
            
        }
        
        return UITableViewCell()
        
    }
    
}
