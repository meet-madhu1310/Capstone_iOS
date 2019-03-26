//
//  Message.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-21.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import UIKit

struct Message: Codable {
    var fromId: String?
    var textMessage: String?
    var timeStamp: Int?
    var toName: String?
    
    init(dict: [String: Any]) {
        fromId = dict["fromId"] as? String
        textMessage = dict["textMessage"] as? String
        timeStamp = dict["timeStamp"] as? Int
        toName = dict["toName"] as? String
    }
}
