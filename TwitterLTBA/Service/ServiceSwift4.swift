//
//  ServiceSwift4.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 07/08/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import UIKit

struct ServiceSwift4{

    let urlStr = "https://api.letsbuildthatapp.com//twitter/home_with_error"

    static let sharedInstace = ServiceSwift4()

    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()){
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if err != nil{
                completion(nil, err)
                return
            }
            guard let dataResp = data else { return }
            
            do {
//                let infoTweet = try JSONDecoder().decode(InfoTweet.self, from: dataResp)
//                let homeDatasource = HomeDatasource(infoTweet: infoTweet)
//                completion(homeDatasource, nil)
                completion(nil, nil)
            } catch let jsonErr{
                print("Error de serialización, descripcion: ", jsonErr)
                completion(nil, jsonErr)
            }
            
        }.resume()
        
        
    }

}

