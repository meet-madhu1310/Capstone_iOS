//
//  ChatTradesmanViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-05.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import Firebase

class ChatTradesmanViewController: UIViewController {

    @IBOutlet var messageTextField: UITextField!
    var toTradesmanName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Send Button Pressed
    @IBAction func sendButtonTapped(_ sender: Any) {
        handleSend()
    }
    
    //MARK: - Send Message Function
    func handleSend() {
        
        let messageRef = Database.database().reference().child("messages")
        let childRef = messageRef.childByAutoId()
        
        let fromId = Auth.auth().currentUser?.uid
        let timeStamp = Int(NSDate().timeIntervalSince1970)
        
        let values = ["textMessage": messageTextField.text!, "toName": toTradesmanName!, "fromId": fromId!, "timeStamp": timeStamp] as [String : Any]
        childRef.updateChildValues(values)
        
    }
}
