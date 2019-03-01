//
//  ConfirmCustomerListViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-01.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ConfirmCustomerListViewController: UIViewController {
    
    let customerNames = ["Customer One", "Customer Two"]
    let customerImages: [UIImage] = [
        UIImage(named: "Alex")!,
        UIImage(named: "Emma")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ConfirmCustomerListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customerName = customerNames[indexPath.row]
        let customerImage = customerImages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell") as? CustomerTableViewCell {
            cell.customerName.text = customerName
            cell.customerImage.image = customerImage
            
            cell.layer.borderColor = UIColor.white.cgColor
            
            cell.customerImage.layer.cornerRadius = cell.customerImage.frame.width / 2
            cell.customerImage.clipsToBounds = true
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}
