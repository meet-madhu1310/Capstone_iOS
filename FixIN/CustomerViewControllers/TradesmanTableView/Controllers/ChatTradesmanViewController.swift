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
    
    var toTradesmanName: String!
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        
        self.hideKeyboard()
        self.messageTextField.delegate = self
        
        messageTextField.layer.cornerRadius = 20.0
        messageTextField.layer.borderWidth = 0.5
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
    
    //MARK: - Keyboard Listeners
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWasShown(notification: NSNotification) {
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize!.height, right: 0.0)

        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets

        var aRect: CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height

        if let activeField = self.activeTextField {
            if (!aRect.contains(activeField.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize!.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
}
