//
//  PendingCustomersViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-02.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class PendingCustomersViewController: UIViewController {
    
    var customerNames = ["Customer One", "Customer Two", "Customer Three"]
    var customerImages: [UIImage] = [
        UIImage(named: "Alex")!,
        UIImage(named: "Emma")!,
        UIImage(named: "Dani")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PendingCustomersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customerName = customerNames[indexPath.row]
        let customerImage = customerImages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PendingsCell") as? CustomersPendingTableViewCell {
            cell.customerNamesLabel.text = customerName
            cell.customerProfileImages.image = customerImage
            
            cell.customerProfileImages.layer.cornerRadius = cell.customerProfileImages.frame.width / 2
            cell.customerProfileImages.clipsToBounds = true
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.customerNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
