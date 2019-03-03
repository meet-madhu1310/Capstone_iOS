//
//  TradesmanListViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class TradesmanListViewController: UIViewController {
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    var categoryName: String!
    
    //for table data
    let tradesmanNames = ["Alex Sim", "Sim Alex", "John Doe", "Smith Nelson", "Dani Anderson", "Emma Rogers", "Nicole Stan"]
    let tradesmanImages: [UIImage] = [
        UIImage(named: "Alex")!,
        UIImage(named: "Sim")!,
        UIImage(named: "John")!,
        UIImage(named: "Smith")!,
        UIImage(named: "Dani")!,
        UIImage(named: "Emma")!,
        UIImage(named: "Nicole")!
    ]
    
    var selectedTradesman: String!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = categoryName
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    

//    @IBAction func menuButtonTapped(_ sender: Any) {
//
//        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
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
//        let cancelButton = NSLocalizedString("No", comment: "")
//        
//        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
//        alertController.addAction(UIAlertAction(title: NSLocalizedString(yesButton, comment: ""), style: .default) { _ in
//            
//            do {
//                try Auth.auth().signOut()
//                
//                self.performSegue(withIdentifier: "logout_segue", sender: self)
//                
//            }
//            catch let signOutError as NSError {
//                print ("Error signing out: %@", signOutError)
//            }
//            
//        })
//        
//        alertController.addAction(UIAlertAction(title: NSLocalizedString(cancelButton, comment: ""), style: .cancel) { _ in})
//        
//        self.present(alertController, animated: true, completion: nil)
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tradesman_detail_segue" {
            let dvc = segue.destination as! TradesmanDetailViewController
            dvc.tradesmanName = selectedTradesman
            dvc.tradsmanImage = selectedImage
        } else {
            if #available(iOS 11.0, *) {
                segue.destination.navigationItem.largeTitleDisplayMode = .never
            }
        }
    }

}

extension TradesmanListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tradesmanNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tradesmanName = tradesmanNames[indexPath.row]
        let imageName = tradesmanImages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TradesmanNameCell") as? TradesmanTableViewCell {
            cell.tradesmanLabel.text = tradesmanName
            cell.tradesmanImage.image = imageName
            
            cell.tradesmanImage.layer.cornerRadius = cell.tradesmanImage.frame.width / 2
            cell.tradesmanImage.clipsToBounds = true
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTradesman = tradesmanNames[indexPath.row]
        selectedImage = tradesmanImages[indexPath.row]
        performSegue(withIdentifier: "tradesman_detail_segue", sender: self)
    }
}
