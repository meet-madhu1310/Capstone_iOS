//
//  ShowCategory.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ShowCategory: UIViewController {
    
    
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    
    var menuIsVisible = false
    var backButtonIsVisible = true
    
    //for table view
    let categoryNames = ["Mechanic", "Plumber", "Carpenter", "Velder", "Painter", "Gardener", "Pipe Fitters", "Electricians"]
    
    var categories: [CategoryList] = []
    let ref = Database.database().reference().child("tradesmen")
    
    let categoryImages: [UIImage] = [
        UIImage(named: "Mechanic")!,
        UIImage(named: "Plumber")!,
        UIImage(named: "Carpenter")!,
        UIImage(named: "Velder")!,
        UIImage(named: "Painter")!,
        UIImage(named: "Gardener")!,
        UIImage(named: "Pipe Fitters")!,
        UIImage(named: "Electricians")!
    ]
    
    var selectedCategory: String!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.child("/Mechanic").observe(.childAdded, with: { snapshot in
            var array: [String] = []
            let value = snapshot.value as? NSDictionary
            let name = value?["FullName"] as? String ?? ""
            array.append(name)
            print("In array:", array)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Preapre for segue func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "category_detail_segue" {
            let dvc = segue.destination as! TradesmanListViewController
            dvc.categoryName = selectedCategory
        }
    }
    
}

//MARK: - TableView Extension
extension ShowCategory: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryName = categoryNames[indexPath.row]
        let imageName = categoryImages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryTableViewCell {
            cell.categoryLabel.text = categoryName
            cell.categoryImage.image = imageName
            
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 3.0
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categoryNames[indexPath.row]
        performSegue(withIdentifier: "category_detail_segue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
