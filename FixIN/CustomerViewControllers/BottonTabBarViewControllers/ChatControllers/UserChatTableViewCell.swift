//
//  UserChatTableViewCell.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

class UserChatTableViewCell: UITableViewCell {

    @IBOutlet var tradesmanNameLabel: UILabel!
    @IBOutlet var recentChatLabel: UILabel!
    @IBOutlet var displayTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
