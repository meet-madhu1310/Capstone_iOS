//
//  SearchViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-05.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchViewController: UIViewController {

    var tradesmanList = [NSDictionary?]()
    var filteredTradesmanList = [NSDictionary?]()
    var refTradesman = Database.database().reference()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var searchTradesmanTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        
        refTradesman.child("tradesmen").queryOrdered(byChild: "fullname").observe(.childAdded, with: { snapshot in
            self.tradesmanList.append(snapshot.value as? NSDictionary)
            self.searchTradesmanTable.insertRows(at: [IndexPath(row: self.tradesmanList.count - 1, section: 0)], with: .automatic)
        })
    }
}

//MARK: - Search Results
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContent(searchText: self.searchBar.text!)
    }
    
    func filterContent(searchText: String) {
        self.filteredTradesmanList = self.tradesmanList.filter { tradesman in
            let tradesmanName = tradesman?["fullname"] as? String
            return(tradesmanName?.contains(searchText))!
        }
        searchTradesmanTable.reloadData()
    }

}

//MARK: - Table View
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text != "" {
            return filteredTradesmanList.count
        }
        return tradesmanList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell") as? SearchTradesmanTableViewCell {
            let tradesman: NSDictionary?
            
            if searchBar.text != "" {
                tradesman = filteredTradesmanList[indexPath.row]
            } else {
                tradesman = tradesmanList[indexPath.row]
            }
            cell.tradesmanNameLabel.text = tradesman?["fullname"] as? String
            print(cell.tradesmanNameLabel.text as Any)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


