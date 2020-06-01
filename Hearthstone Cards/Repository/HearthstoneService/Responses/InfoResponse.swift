//
//  InfoResponse.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 01/06/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

class InfoResponse: Decodable {
    let classes: [String]
    let sets: [String]
    let types: [String]
    let factions: [String]
    let qualities: [String]
    let races: [String]
    
}
