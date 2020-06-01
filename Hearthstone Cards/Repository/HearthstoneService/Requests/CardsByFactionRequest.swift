//
//  CardsByFactionRequest.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 01/06/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation


class CardsByFactionRequest: HearthstoneRequest {
    let option: String
    
    init(with option: String) {
        self.option = option
    }
    
    override var endpoint: String {
        return "/cards/factions/\(option)"
    }
    
}
