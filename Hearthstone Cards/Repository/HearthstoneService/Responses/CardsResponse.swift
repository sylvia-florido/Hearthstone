//
//  CardsResponse.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 01/06/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

class CardsResponse: Decodable {
    let cardId: String
    let name: String
    let img: String?
    let imgGold: String?
}

