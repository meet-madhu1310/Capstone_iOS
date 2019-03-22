//
//  UserChatListTableViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import Firebase

class UserChatListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "All Chats"
        
        observeMessages()
    }
    
    var messages = [String]()
    var names = [String]()
    var timeStamps = [String]()
    
    //MARK: - Get Messages
    func observeMessages() {
        let messageRef = Database.database().reference().child("messages")
        messageRef.observe(.childAdded, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let message = dict["textMessage"] as? String
                self.messages.append(message!)
                self.tableView.reloadData()
            }
            if let dict = snapshot.value as? [String: Any] {
                let name = dict["toName"] as? String
                self.names.append(name!)
                self.tableView.reloadData()
            }
            if let dict = snapshot.value as? [String: Any] {
                let timeStamp = dict["timeStamp"] as? Int
                self.timeStamps.append(String(timeStamp!))
                self.tableView.reloadData()
            }
        }, withCancel: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        let name = names[indexPath.row]
        let timeStamp = timeStamps[indexPath.row]

        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as? UserChatTableViewCell {
            cell.tradesmanNameLabel.text = name
            cell.recentChatLabel.text = message
            
            let timeStampDate = NSDate(timeIntervalSince1970: Double(timeStamp)!)
            cell.displayTimeLabel.text = timeStampDate.description
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

 }
