//
//  TradesmanListViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-02-16.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TradesmanListViewController: UIViewController {
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    var categoryName: String!
    
    //MARK: - Properties
    let tradesmanImages: [UIImage] = [
        UIImage(named: "Alex")!,
        UIImage(named: "Sim")!,
        UIImage(named: "John")!,
        UIImage(named: "Smith")!,
        UIImage(named: "Dani")!,
        UIImage(named: "Emma")!,
        UIImage(named: "Nicole")!
    ]
    
    var selectedTradesman: String!
    var selectedImage: UIImage!
    
    var categories: [CategoryList] = []
    let refTradesmen = Database.database().reference(withPath: "tradesmen")
    @IBOutlet weak var tradesmenTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = UIColor.white
        fetchTradesman()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = categoryName
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: Fetch Tradesman From Firebase
    func fetchTradesman() {
        if self.categoryName == "Plumber" {
            refTradesmen.child("/Plumber").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else if self.categoryName == "Mechanic" {
            refTradesmen.child("/Mechanic").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else if self.categoryName == "Gardener" {
            refTradesmen.child("/Gardener").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else if self.categoryName == "Painter" {
            refTradesmen.child("/Painter").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else if self.categoryName == "Pipe Fitters" {
            refTradesmen.child("/Pipe Fitters").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else if self.categoryName == "Velder" {
            refTradesmen.child("/Velder").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else if self.categoryName == "Electricians" {
            refTradesmen.child("/Electricians").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        } else {
            refTradesmen.child("/Carpenter").observe(.value, with: { snapshot in
                var newItems: [CategoryList] = []
                for child in snapshot.children{
                    if let snapshot = child as? DataSnapshot,
                        let groceryItems = CategoryList(snapshot: snapshot) {
                        newItems.append(groceryItems)
                    }
                }
                self.categories = newItems
                self.tradesmenTable.reloadData()
            })
        }
    }
    
    //MARK: - Navigation to Tradesman Details
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tradesman_detail_segue" {
            let dvc = segue.destination as! TradesmanDetailViewController
            dvc.tradesmanName = selectedTradesman
            dvc.tradsmanImage = selectedImage
        } else {
            if #available(iOS 11.0, *) {
                segue.destination.navigationItem.largeTitleDisplayMode = .never
            }
        }
    }

}

//MARK: - TableView
extension TradesmanListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tradesmanName = categories[indexPath.row]
        let imageName = tradesmanImages[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TradesmanNameCell") as? TradesmanTableViewCell {
            cell.tradesmanLabel.text = tradesmanName.fullname
            cell.tradesmanImage.image = imageName
            
            cell.tradesmanImage.layer.cornerRadius = cell.tradesmanImage.frame.width / 2
            cell.tradesmanImage.clipsToBounds = true
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTradesman = categories[indexPath.row].fullname
        selectedImage = tradesmanImages[indexPath.row]
        performSegue(withIdentifier: "tradesman_detail_segue", sender: self)
    }
}
