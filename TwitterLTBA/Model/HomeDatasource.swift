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
//    se deben de llenar los elementos mediante users y tweets
    let users: [User]
    let tweets : [Tweet]
    
    init(infoTweet: InfoTweet){
        self.users = infoTweet.users
        self.tweets = infoTweet.tweets
    }
    
    required init(json: JSON) throws {
        guard let userJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "'users or tweets' are not valid in JSON"])
        }
       
        
        self.users = userJsonArray.map{User(json: $0)}
        self.tweets = tweetJsonArray.map{Tweet(json: $0)}
    }
    
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
