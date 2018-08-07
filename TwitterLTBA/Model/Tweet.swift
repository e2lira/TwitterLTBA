//
//  Tweet.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 24/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet: Decodable {
    let user: User
    let message: String
    
    init(json: JSON){
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
