//
//  ChatTradesmanViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-05.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth

class ChatTradesmanViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var messageCollectionView: UICollectionView!
    
    var toTradesmanName: String!
    var userId: String?
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        
        self.hideKeyboard()
        self.messageTextField.delegate = self
        
        messageTextField.layer.cornerRadius = 20.0
        messageTextField.layer.borderWidth = 0.5
        
        observeMessages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Send Button Pressed
    @IBAction func sendButtonTapped(_ sender: Any) {
        handleSend()
        self.messageTextField.text = ""
    }
    
    //MARK: - Send Message Function
    func handleSend() {
        
        let messageRef = Database.database().reference().child("messages")
        let childRef = messageRef.childByAutoId()
        
        let timeStamp = Int(NSDate().timeIntervalSince1970)
        let fromId = "1K4HI7JsH7XOofij30GAsBSnj9i2"
        
        let values = ["textMessage": messageTextField.text!, "toName": toTradesmanName!, "fromId": fromId, "timeStamp": timeStamp] as [String : Any]
        childRef.updateChildValues(values)
        
    }
    
    //MARK: - Load Messages
    func observeMessages() {
        let messageRef = Database.database().reference().child("messages")
        messageRef.observe(.childAdded, with: { (snapshot) in
            guard let dict = snapshot.value as? [String: Any] else {
                return
            }
            let message = Message(dict: dict)
            self.messages.append(message)
            self.messageCollectionView.reloadData()
        }, withCancel: nil)
    }
    
}

//MARK: CollectionView
extension ChatTradesmanViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCell", for: indexPath) as? ChatCollectionViewCell {
            
            let text = messages[indexPath.row].textMessage
            cell.showChatLabel.text = text
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
    
}
