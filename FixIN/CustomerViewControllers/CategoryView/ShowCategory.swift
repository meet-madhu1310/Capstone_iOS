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
    @IBOutlet weak var categoryTable: UITableView!
    
    //for table view
    let categoryNames = ["Mechanic", "Plumber", "Carpenter", "Welder", "Painter", "Gardener", "Pipe Fitters", "Electricians", "House Cleaning", "Kitchen Installments", "Floor Repairing", "Decks", "Home Appliance", "Railings"]
    
    var categories: [CategoryList] = []
    let refTradesmen = Database.database().reference(withPath: "tradesmen")
    
    let categoryImages: [UIImage] = [
        UIImage(named: "Mechanic")!,
        UIImage(named: "Plumber")!,
        UIImage(named: "Carpenter")!,
        UIImage(named: "Velder")!,
        UIImage(named: "Painter")!,
        UIImage(named: "Gardener")!,
        UIImage(named: "Pipe Fitters")!,
        UIImage(named: "Electricians")!,
        UIImage(named: "HouseCleaning")!,
        UIImage(named: "KitchenInstallments")!,
        UIImage(named: "FloorRepairing")!,
        UIImage(named: "Decks")!,
        UIImage(named: "HomeAppliance")!,
        UIImage(named: "Railings")!
    ]
    
    var selectedCategory: String!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let meet = Database.database().reference()
        var h: [String] = []
        
        meet.child("tradesmen").observe(.childAdded, with: { snapshot in
            h.append(snapshot.key)
            print("value of h:", h)
        })
        print("hahaha", h.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Send data to TradesmanDetailView Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "category_detail_segue" {
            let dvc = segue.destination as! TradesmanListViewController
            dvc.categoryName = selectedCategory
        }
    }
    
}

//MARK: - Collection View
extension ShowCategory: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let categoryName = categoryNames[indexPath.row]
        let categoryImage = categoryImages[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell {
            
            cell.categoryNameLabel.text = categoryName
            cell.categoryImageView.image = categoryImage
            cell.categoryImageView.layer.cornerRadius = 10.0
            cell.categoryImageView.layer.masksToBounds = true
            
            cell.layer.cornerRadius = 10.0
            cell.layer.masksToBounds = true
            
            cell.layer.shadowRadius = 3.0
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOpacity = 2.0
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            cell.layer.masksToBounds = false
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategory = categoryNames[indexPath.row]
        performSegue(withIdentifier: "category_detail_segue", sender: self)
    }
    
}
