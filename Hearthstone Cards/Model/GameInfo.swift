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
    
    init(sets: [String]?, classes: [String]?, types: [String]?, factions: [String]?, qualities: [String]?, races: [String]?) {
        super.init()
        let possibleCategories = [CardsFilter.bySet : sets,
                               CardsFilter.byClass : classes,
                               CardsFilter.byType : types,
                               CardsFilter.faction : factions,
                               CardsFilter.quality : qualities,
                               CardsFilter.race : races ]
        
        let categories = possibleCategories.compactMap { (key, values) -> CardCategory? in
            if let values = values, values.count > 0 {
                return CardCategory(filteredBy: key, named: key.rawValue, options: values)
            } else {
                return nil
            }
        }
     
        self.cardCategories = categories
    }
    
    convenience init(response: InfoResponse) {
        self.init(sets: response.sets, classes: response.classes, types: response.types, factions: response.factions, qualities: response.qualities, races: response.races)
    }
    
 // Test filters build
//        let arr = ["a", "b", "c"]
//        let gameInfo = GameInfo(with: [], classes: ["a", "b", "c"], types: ["a", "b", "c"], factions: ["a", "b", "c"], qualities: ["a", "b", "c"], races: [])
//        print(gameInfo.filters)
}


class CardCategory: NSObject {
    let filterType: CardsFilter
    let name: String
    let options: [String]
    var cards: [Card]?
    
    
    init(filteredBy: CardsFilter, named: String, options: [String]) {
        self.filterType = filteredBy
        self.name = named
        self.options = options
    }
}



