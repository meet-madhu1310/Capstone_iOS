//
//  NotificationTableViewCell.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-04-09.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet var tradespersonImageView: UIImageView!
    @IBOutlet var tradespersonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
