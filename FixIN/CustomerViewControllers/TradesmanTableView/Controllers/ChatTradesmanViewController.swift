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
    @IBOutlet var sendChatViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var myView: UIScrollView!
    
    var toTradesmanName: String!
    var userId: String?
    
    var messages = [Message]()
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        
        self.hideKeyboard()
        self.messageTextField.delegate = self
        
        messageTextField.layer.cornerRadius = 20.0
        messageTextField.layer.borderWidth = 0.5
        
        messageCollectionView.alwaysBounceVertical = true
        messageCollectionView.keyboardDismissMode = .interactive
        messageCollectionView.isScrollEnabled = true
        
        observeMessages()
        setupKeyboardObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Interactive Keyboard
    func setupKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func handleKeyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        self.myView.frame.origin.y = -keyboardFrame!.height + 65
        UIView.animate(withDuration: 3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func handleKeyboardWillHide(notification: NSNotification ) {
        self.myView.frame.origin.y = 65
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
            
            if self.toTradesmanName == message.toName {
                self.messages.append(message)
                self.messageCollectionView.reloadData()
            }
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
            
            cell.chatBackgroundView.layer.cornerRadius = 10.0
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 50
        
        if let text = messages[indexPath.row].textMessage {
            height = estimateFrameForText(text: text).height + 50
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    ///Dynamic Cell Height
    private func estimateFrameForText(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1500)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 17.0)], context: nil)
    }
}
