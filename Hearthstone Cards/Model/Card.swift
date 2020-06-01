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
    let cardSet: String
    let cardType: String
    let faction: String
    let race: String

    let rarity: String
    let cost: Int
    let attack: Int
    let health: Int
    
    let imgUrl: String
    let imgGoldUrl: String
    
    
    init(cardId: String, name: String, cardSet: String, cardType: String, faction: String, race: String, rarity: String, cost: Int, attack: Int, health: Int, imgUrl: String,  imgGoldUrl: String ) {
        self.cardId = cardId
        self.name = name
        self.cardSet = cardSet
        self.cardType = cardType
        self.faction = faction
        self.race = race
        self.rarity = rarity
        self.cost = cost
        self.attack = attack
        self.health = health
        self.imgUrl = imgUrl
        self.imgGoldUrl = imgGoldUrl
    }
}
