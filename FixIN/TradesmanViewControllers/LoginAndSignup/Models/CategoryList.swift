//
//  CategoryList.swift
//  FixIN
//
//  Created by Meet Madhu on 2019-03-12.
//  Copyright © 2019 Meet Madhu. All rights reserved.
//

import Foundation
import Firebase

struct CategoryList {
    let ref: DatabaseReference?
    let key: String
    let fullname: String
    let email: String
    let profession: String
    let hourlyrate: String
    let availibility: String

    init(fullname: String, email: String, profession: String, hourlyrate: String, availibility: String ,key: String = "") {
        self.ref = nil
        self.key = key
        self.fullname = fullname
        self.email = email
        self.profession = profession
        self.hourlyrate = hourlyrate
        self.availibility = availibility
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let fullname = value["fullname"] as? String,
            let email = value["email"] as? String,
            let profession = value["profession"] as? String,
            let hourlyrate = value["hourlyrate"] as? String,
            let availibility = value["availibility"] as? String else {
                return nil
            }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.fullname = fullname
        self.email = email
        self.profession = profession
        self.hourlyrate = hourlyrate
        self.availibility = availibility
    }
    
    func toAnyObject() -> Any {
        return [
            "fullname": fullname,
            "email": email,
            "profession": profession,
            "hourlyrate": hourlyrate,
            "availibility": availibility
        ]
    }
}
