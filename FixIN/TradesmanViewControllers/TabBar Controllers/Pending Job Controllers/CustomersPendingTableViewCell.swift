//
//  CustomersPendingTableViewCell.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-02.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class CustomersPendingTableViewCell: UITableViewCell {

    @IBOutlet weak var customerNamesLabel: UILabel!
    @IBOutlet weak var customerProfileImages: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
