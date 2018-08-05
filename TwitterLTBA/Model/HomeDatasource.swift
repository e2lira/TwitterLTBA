//
//  HomeDatasource.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 18/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    required init(json: JSON) throws {
        var users = [User]()
        let array = json["users"].array
        for userJson in array!{
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        
        self.users = users
    }
    
//    let words = ["user1", "user2", "user3"]
//    let tweets = ["tweet1","tweet2"]
    let tweets : [Tweet]={
        let edgarUser = User(name: "Edgar Lira", username: "@e2lira", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS App´s!",profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet = Tweet(user: edgarUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really need a logn text block to render aout so we're going to stop here.")
        
        let tweet2 = Tweet(user: edgarUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really need a logn text block to render aout so we're going to stop here.")
        
       return [tweet, tweet2]
    }()
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
//    Registrar las Clases para la vista de cada celda
    override func cellClasses() -> [DatasourceCell.Type] {
        return[UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
//        para mostrar la sección de abajo de tweets messages
        if (indexPath.section == 1){
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if (section == 1){
            return tweets.count
        }
        return users.count
    }
    
//     Para incrementar el número de secciones en el collectionVie
    override func numberOfSections() -> Int {
        return 2 
    }
    
}
