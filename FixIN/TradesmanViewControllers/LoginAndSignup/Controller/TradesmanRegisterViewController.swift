//
//  TradesmanRegisterViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import Photos

import FirebaseDatabase
import FirebaseAuth
import Firebase

class TradesmanRegisterViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    var category: [CategoryList] = []
    let refTradesmen = Database.database().reference(withPath: "tradesmen")
    let professions = ["- select your profession -","Velder", "Plumber", "Pipe Fitters", "Mechanic", "Gardener", "Painter", "Electricians", "Carpenter"]
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var professionPicker: UIPickerView!
    @IBOutlet var profileImageView: UIImageView!
    
    var selectedProfession: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        
        //setting only bottom border
        fullNameTextField.setBottomBorder()
        emailAddressTextField.setBottomBorder()
        
        //when NEXT button is pressed
        fullNameTextField.delegate = self
        emailAddressTextField.delegate = self
        
        self.hideKeyboard()
        
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(uploadProfileImage)))
        profileImageView.isUserInteractionEnabled = true
    }
    
    //MARK: - Move to next textFiled, NEXT is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case fullNameTextField:
            emailAddressTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    //Mark: Pushing to Firebase
    func addTradesman() {
        
        let categoryItem = CategoryList(fullname: fullNameTextField.text!, email: emailAddressTextField.text!, profession: selectedProfession)
        let categoryItemRef = self.refTradesmen.child(selectedProfession).childByAutoId()
        categoryItemRef.setValue(categoryItem.toAnyObject())
    }
    
    //MARK: Create button tapped
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        addTradesman()
        self.fullNameTextField.text = ""
        self.emailAddressTextField.text = ""
    }
    
}

//MARK: Extension of CategoryPicker View
extension TradesmanRegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return professions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return professions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedProfession = professions[row]
    }
    
}

//MARK: - Image PickerView
extension TradesmanRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func uploadProfileImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
//        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.contentMode = .scaleToFill
            profileImageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled.")
        dismiss(animated: true, completion: nil)
    }
    
}
