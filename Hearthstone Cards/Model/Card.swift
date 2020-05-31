//
//  Card.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation


class Card: NSObject {
    let cardId: String
    let name: String
    var cardSet: String?
    let cardType: String
    let faction: String
    let race: String

    let rarity: String
    let cost: Int
    let attack: Int
    let health: Int
    
    let imgUrl: String
    let imgGoldUrl: String
    
    
    override init(cardId: String, name: String) {
        super.init()
    }
}
