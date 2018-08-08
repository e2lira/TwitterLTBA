//
//  User.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 21/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User: Decodable {
    let name: String
    let username: String
    let bio: String
    let profileImageUrl: String
    
    init(json: JSON){
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bio = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
