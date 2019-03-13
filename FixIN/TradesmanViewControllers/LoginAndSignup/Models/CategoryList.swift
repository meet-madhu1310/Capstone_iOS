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

    init(fullname: String, email: String, profession: String, key: String = "") {
        self.ref = nil
        self.key = key
        self.fullname = fullname
        self.email = email
        self.profession = profession
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let fullname = value["fullname"] as? String,
            let email = value["email"] as? String,
            let profession = value["profession"] as? String else {
                return nil
            }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.fullname = fullname
        self.email = email
        self.profession = profession
    }
    
    func toAnyObject() -> Any {
        return [
            "fullname": fullname,
            "email": email,
            "profession": profession
        ]
    }
}
