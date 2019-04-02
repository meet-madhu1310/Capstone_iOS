//
//  UserBookingsViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-29.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class UserBookingsViewController: UIViewController {
    
    @IBOutlet var yourBookingLabel: UILabel!
    
    var tradesmanImages: [UIImage] = [
        UIImage(named: "Alex")!,
        UIImage(named: "Nicole")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Bookings"
        
        ///Drop Shadow for Label
        yourBookingLabel.layer.shadowColor = UIColor.darkGray.cgColor
        yourBookingLabel.layer.shadowRadius = 3.0
        yourBookingLabel.layer.shadowOpacity = 1.0
        yourBookingLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        yourBookingLabel.layer.masksToBounds = false
    }
    
    //MARK: Done Button Tapped
    @IBAction func doneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "review_segue", sender: self)
    }
    
}

//MARK: - Table View DataSource and DataDelegate
extension UserBookingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tradesmanImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tradesmanImage = tradesmanImages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ViewBookingCell") as? ViewUserBookingTableViewCell {
            cell.tradesmanImage.image = tradesmanImage
            
            cell.tradesmanImage.layer.cornerRadius = cell.tradesmanImage.frame.width / 2
            cell.tradesmanImage.clipsToBounds = true
            
            cell.doneButton.layer.cornerRadius = 10.0
            cell.doneButton.layer.masksToBounds = true
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tradesmanImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
