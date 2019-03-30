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
import FirebaseStorage

class TradesmanRegisterViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    var category: [CategoryList] = []
    let refTradesmen = Database.database().reference(withPath: "tradesmen")
    let professions = ["- select your profession -","Welder", "Plumber", "Pipe Fitters", "Mechanic", "Gardener", "Painter", "Electricians", "Carpenter", "Appliance Repair", "Railings", "House Cleaning", "Floor Repairs", "Decks", "Kitchen Installments"]
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var hourlyRateTextField: UITextField!
    @IBOutlet var availibilityTextField: UITextField!
    
    @IBOutlet weak var professionPicker: UIPickerView!
    @IBOutlet var profileImageView: UIImageView!
    
    var selectedProfession: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        
        //setting only bottom border
        fullNameTextField.setBottomBorder()
        emailAddressTextField.setBottomBorder()
        hourlyRateTextField.setBottomBorder()
        availibilityTextField.setBottomBorder()
        
        //when NEXT button on KEYBOARD is pressed
        fullNameTextField.delegate = self
        emailAddressTextField.delegate = self
        hourlyRateTextField.delegate = self
        availibilityTextField.delegate = self
        
        self.hideKeyboard()
        
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(uploadProfileImage)))
        profileImageView.isUserInteractionEnabled = true
    }
    
    //MARK: - Move to next textFiled, NEXT is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case fullNameTextField:
            emailAddressTextField.becomeFirstResponder()
        case emailAddressTextField:
            hourlyRateTextField.becomeFirstResponder()
        case hourlyRateTextField:
            availibilityTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    //Mark: Pushing to Firebase
    func addTradesman() {
        let categoryItem = CategoryList(fullname: fullNameTextField.text!, email: emailAddressTextField.text!, profession: selectedProfession, hourlyrate: hourlyRateTextField.text!, availibility: availibilityTextField.text!)
        let categoryItemRef = self.refTradesmen.child(selectedProfession).childByAutoId()
        categoryItemRef.setValue(categoryItem.toAnyObject())
    }
    
    //MARK: Create button tapped
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
        ///Check Fields are not empty
        if fullNameTextField.text == "" && emailAddressTextField.text == "" && hourlyRateTextField.text == "" && availibilityTextField.text == "" {
            
            fullNameTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "All fields required", message: "Please fill all fields.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if emailAddressTextField.text == "" {
            
            emailAddressTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Email address required", message: "Please enter your email address.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if hourlyRateTextField.text == "" {
            
            hourlyRateTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Hourly rate required", message: "Please enter your hourly rate.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else if availibilityTextField.text == "" {
            
            availibilityTextField.becomeFirstResponder()
            
            let alertController = UIAlertController(title: "Availibility required", message: "Please enter your availibility.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            addTradesman()
            self.performSegue(withIdentifier: "tradesman_register_home_segue", sender: self
        )
        }
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
        
        guard let selectedImage = selectedImageFromPicker, let imageData = selectedImage.pngData() else {
            profileImageView.contentMode = .scaleToFill
            dismiss(animated: true, completion: nil)
            return
        }
        self.profileImageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
        let storageRef = Storage.storage().reference().child("profile.png")
        let metadata = StorageMetadata(dictionary: ["contentType": "image/png"])
        
        let uploadTask = storageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            guard metadata != nil else {
                print(error?.localizedDescription as Any)
                return
            }
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancelled.")
        dismiss(animated: true, completion: nil)
    }
    
}
