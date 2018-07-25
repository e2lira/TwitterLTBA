//
//  HomeDatasource.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 18/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User]={
        let edgarUser = User(name: "Edgar Lira", username: "@e2lira", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS App´s!",profileImage: #imageLiteral(resourceName: "profile_image"))
        let sebasUser = User(name: "Sebastián Elias", username: "@SebasElias", bioText: "Sebastián esta muy contento de tener su nueva actiivdad ", profileImage: #imageLiteral(resourceName: "profile_sebas"))
        let kindleCourseUser = User(name: "Kindle Course User", username: "@kindleCourse", bioText: "Este es un curso para poder desarrollar una App de Twitter, usando elementos como CollectionViewController y CollectionTableView, es objetivo es adquirir abilidades para desarrollar app en iOS. Este es un curso para poder desarrollar una App de Twitter, usando elementos como CollectionViewController y CollectionTableView, es objetivo es adquirir abilidades para desarrollar app en iOS", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [edgarUser, sebasUser, kindleCourseUser]
    }()
    
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
