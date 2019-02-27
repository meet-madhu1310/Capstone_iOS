//
//  ShowCategory.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ShowCategory: UIViewController {
    
    
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    
    var menuIsVisible = false
    var backButtonIsVisible = true
    
    //for table view
    let categoryNames = ["Mechanic", "Plumber", "Carpenter", "Velder", "Painter", "Gardener", "Pipe Fitters", "Electricians"]
    var selectedCategory: String!
    let cellSpacingHeight: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookingsButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "categoryToBookings_segue", sender: self)
    }    
    
//    @IBAction func menuButtonTapped(_ sender: Any) {
//
//        if !menuIsVisible {
//            leadingC.constant = 200
//
//            trailingC.constant = 0
//            menuIsVisible = true
//
//        } else {
//            leadingC.constant = 0
//            trailingC.constant = 0
//
//            menuIsVisible = false
//        }
//
//        UIView.animate( withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {self.view.layoutIfNeeded()} )
//
//    }
    
    
//    @IBAction func logoutButtonTapped(_ sender: Any) {
//        
//        let title = NSLocalizedString("Are you sure?", comment: "")
//        let yesButton = NSLocalizedString("Yes", comment: "")
//        let noButton = NSLocalizedString("No", comment: "")
//        
//        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: NSLocalizedString(yesButton, comment: ""), style: .default) { _ in
//            
//            do {
//                try Auth.auth().signOut()
//                
//                self.performSegue(withIdentifier: "categoryLogoutTo_home_segue", sender: self)
//                
//            }
//            catch let signOutError as NSError {
//                print ("Error signing out: %@", signOutError)
//            }
//            
//        })
//        
//        alertController.addAction(UIAlertAction(title: NSLocalizedString(noButton, comment: ""), style: .cancel) { _ in })
//        
//        self.present(alertController, animated: true, completion: nil)
//        
//    }
    
    //MARK: - Preapre for segue func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "category_detail_segue" {
            let dvc = segue.destination as! TradesmanListViewController
            dvc.categoryTitle = selectedCategory
        }
    }
    
}

//MARK: - TableView Extension
extension ShowCategory: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryName = categoryNames[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryTableViewCell {
            cell.categoryLabel.text = categoryName
            
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 3.0
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categoryNames[indexPath.row]
        performSegue(withIdentifier: "category_detail_segue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return cellSpacingHeight
//    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return categoryNames.count
//    }
    
}
