//
//  InfoRequest.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 31/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

class InfoRequest: HearthstoneRequest {
    
    override var endpoint: String {
        return "/info"
    }
    
}

