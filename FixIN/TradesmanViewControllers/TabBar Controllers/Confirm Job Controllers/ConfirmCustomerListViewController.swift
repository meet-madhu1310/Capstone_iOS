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
    
    //define varible to get and set the name of particular customer on ChatController
    var selectedCustomer: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Confirm Jobs"
    }
    
    //MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - navigation to ChatController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chatWith_customer_segue" {
            let dvc = segue.destination as! ChatWithCustomerViewController
            dvc.customerName = selectedCustomer
        } else {
            if #available(iOS 11.0, *) {
                segue.destination.navigationItem.largeTitleDisplayMode = .never
            }
        }
    }

}

//MARK: TableView of ConfirmJobs
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCustomer = customerNames[indexPath.row]
        performSegue(withIdentifier: "chatWith_customer_segue", sender: self)
    }
    
}
