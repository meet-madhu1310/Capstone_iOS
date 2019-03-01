//
//  CustomerTableViewCell.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-01.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customerImage: UIImageView!
    @IBOutlet weak var customerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
