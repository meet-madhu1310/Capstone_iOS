//
//  Test_&_Sample.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-13.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import Foundation
import Firebase
//MARK: TradesmanRegisterViewController
//put this code in viewDidLoad() method


//refTradesmen.observe(.childAdded, with: { snapshot in
//    var newItems: [CategoryList] = []
//    for child in snapshot.children{
//        if let snapshot = child as? DataSnapshot,
//            let groceryItems = CategoryList(snapshot: snapshot) {
//            newItems.append(groceryItems)
//        }
//    }
//    self.categories = newItems
//    self.categoryTable.reloadData()
//    //
//    print("no idea: ",self.categories)
//    print("lets count",self.categories.count)
//})


//===================================================================================
//MARK: - LOGOUT


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

// MARK: in UserChatListTableView file
//        messageRef.observe(.childAdded, with: { (snapshot) in
//            if let dict = snapshot.value as? [String: Any] {
//                let message = dict["textMessage"] as? String
//                self.messages.append(message!)
//                self.messages.reverse()
//                self.tableView.reloadData()
//            }
//            if let dict = snapshot.value as? [String: Any] {
//                let name = dict["toName"] as? String
//                self.names.append(name!)
//                self.names.reverse()
//                self.tableView.reloadData()
//            }
//            if let dict = snapshot.value as? [String: Any] {
//                let timeStamp = dict["timeStamp"] as? Int
//                self.timeStamps.append(String(timeStamp!))
//                self.timeStamps.reverse()
//                self.tableView.reloadData()
//            }
//        }, withCancel: nil)
