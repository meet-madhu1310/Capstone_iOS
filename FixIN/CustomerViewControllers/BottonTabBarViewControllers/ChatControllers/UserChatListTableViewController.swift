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
    
    var messages = [Message]()
    var messagesDict = [String: Message]()
    var selectedTradesmanName: String?
    
    //MARK: - Get Messages
    func observeMessages() {
        let messageRef = Database.database().reference().child("messages")
        messageRef.observe(.childAdded, with: { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let message = Message(dict: dict)
                
                ///TO group messages per name and show latest message
                if let toName = message.toName {
                    self.messagesDict[toName] = message
                    self.messages = Array(self.messagesDict.values)
                    self.messages.sort(by: { (message1, message2) -> Bool in
                        return message1.timeStamp.hashValue > message2.timeStamp.hashValue
                    })
                }
                
                self.tableView.reloadData()
            }
        }, withCancel: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let name = messages[indexPath.row].toName
        let message = messages[indexPath.row].textMessage
        let timeStamp = messages[indexPath.row].timeStamp

        if let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as? UserChatTableViewCell {
            cell.tradesmanNameLabel.text = name
            cell.recentChatLabel.text = message
            
            let timeStampDate = NSDate(timeIntervalSince1970: Double(timeStamp!))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            cell.displayTimeLabel.text = dateFormatter.string(from: timeStampDate as Date)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTradesmanName = messages[indexPath.row].toName
        performSegue(withIdentifier: "load_chat_segue", sender: self)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "load_chat_segue" {
            let dvc = segue.destination as! ChatTradesmanViewController
            dvc.toTradesmanName = selectedTradesmanName
        }
    }

 }
