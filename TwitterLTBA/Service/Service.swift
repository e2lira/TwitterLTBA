//
//  Service.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 05/08/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//  Clase singleton para la descarga de información

import Foundation
import TRON
import SwiftyJSON

struct Service {
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
//    Sigleton object, solamente se crea un objeto en toda la App
    static let sharedInstance = Service()
    // completion block se ejecuta una vez que termina la descarga del request, permite pasar parametros
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()){
        print("Fetcing home feed")
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully decode json object count: ", homeDatasource.users.count)
            completion(homeDatasource)
        }) { (err) in
            print("Fail to fetch json", err)
        }
    }
    
    class JSONError : JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Error")
        }
    }
    
}
