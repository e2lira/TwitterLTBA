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
        let edgarUser = User(name: "Edgar Lira", username: "e2lira", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS App´s!",profileImage: #imageLiteral(resourceName: "profile_image"))
        let sebasUser = User(name: "Sebastián Elias", username: "@SebasElias", bioText: "Sebastián esta muy contento de tener su nueva actiivdad ", profileImage: #imageLiteral(resourceName: "profile_sebas"))
        let kindleCourseUser = User(name: "Kindle Course User", username: "@kindleCourse", bioText: "Este es un curso para poder desarrollar una App de Twitter, usando elementos como CollectionViewController y CollectionTableView, es objetivo es adquirir abilidades para desarrollar app en iOS. Este es un curso para poder desarrollar una App de Twitter, usando elementos como CollectionViewController y CollectionTableView, es objetivo es adquirir abilidades para desarrollar app en iOS", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [edgarUser, sebasUser, kindleCourseUser]
    }()
    
//    let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return[UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
