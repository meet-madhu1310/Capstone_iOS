//
//  ViewUserBookingTableViewCell.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-29.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class ViewUserBookingTableViewCell: UITableViewCell {

    @IBOutlet var tradesmanImage: UIImageView!
    @IBOutlet var doneButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
