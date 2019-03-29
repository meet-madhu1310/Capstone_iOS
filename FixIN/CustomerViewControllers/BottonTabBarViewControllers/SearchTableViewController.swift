//
//  SearchTableViewController.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-26.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var tradesmanList = [NSDictionary]()
    var filteredTradesman = [NSDictionary]()
    @IBOutlet weak var findTradesmanTable: UITableView!
    
    let ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///For search Controller
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        ref.child("tradesmen").queryOrdered(byChild: "fullname").observe(.childAdded, with: { (snapshot) in
            self.tradesmanList.append(snapshot.value as! NSDictionary)
            self.findTradesmanTable.insertRows(at: [IndexPath(row: self.tradesmanList.count - 1, section: 0)], with: .automatic)
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTradesman.count
        }
        return tradesmanList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TradesmanCell")
        
        let tradesman: NSDictionary?
        if searchController.isActive && searchController.searchBar.text != "" {
            tradesman = filteredTradesman[indexPath.row]
        } else {
            tradesman = self.tradesmanList[indexPath.row]
        }
        
        cell?.textLabel!.text = tradesman?["fullname"] as? String
        cell?.detailTextLabel!.text = tradesman?["profession"] as? String
        
        print("not getting", tradesman?["fullname"] as Any)
        
        return cell!
    }
    
    //MARK: Search Result Update
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchText: self.searchController.searchBar.text!)
    }
    
    func filterContent(searchText: String) {
        self.filteredTradesman = self.tradesmanList.filter{ tradesman in
            let tradesmanName = tradesman["fullname"] as? String
            
            return (tradesmanName != nil)
        }
        
        tableView.reloadData()
    }
}
