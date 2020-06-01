//
//  GameInfo.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

class GameInfo: NSObject {

    var cardCategories: [CardCategory] = [CardCategory]()
    
    init(with sets: [String]?, classes: [String]?, types: [String]?, factions: [String]?, qualities: [String]?, races: [String]?) {
        super.init()
        let possibleCategories = ["Set" : sets,
                               "Class" : classes,
                               "Type" : types,
                               "Faction" : factions,
                               "Quality" : qualities,
                               "Race" : races ]
        
        let categories = possibleCategories.compactMap { (key, values) -> CardCategory? in
            if let values = values, values.count > 0 {
                return CardCategory(named: key, options: values)
            } else {
                return nil
            }
        }
     
        self.cardCategories = categories
    }
    
 // Test filters build
//        let arr = ["a", "b", "c"]
//        let gameInfo = GameInfo(with: [], classes: ["a", "b", "c"], types: ["a", "b", "c"], factions: ["a", "b", "c"], qualities: ["a", "b", "c"], races: [])
//        print(gameInfo.filters)
}


class CardCategory: NSObject {
    let name: String
    let options: [String]
    var cards: [Card]?
    
    init(named: String, options: [String]) {
        self.name = named
        self.options = options
    }
}



