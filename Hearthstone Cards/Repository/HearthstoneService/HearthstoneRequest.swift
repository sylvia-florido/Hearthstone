//
//  HearthstoneRequest.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 01/06/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

class HearthstoneRequest: BaseRequest {
    var rawUrl: String {
        get {
            return "https://omgvamp-hearthstone-v1.p.rapidapi.com\(endpoint)"
        }
    }
    
    var endpoint: String {
        get {
            return ""
        }
    }
    
    var method: HTTPMethod {
        get {
            return .get
        }
    }
    
    var body: [String : Any]?

    
    var headers: [String : String]? = [
        "x-rapidapi-host": "omgvamp-hearthstone-v1.p.rapidapi.com",
        "x-rapidapi-key": "8a546760d7msh477f172e51c01c2p1f6f21jsn87c28ece2319"
    ]
    
    
}
