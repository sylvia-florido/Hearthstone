//
//  HomeViewModel.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 31/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

struct HomeViewModel {
    let categories: [CategoryCellViewModel]
    
    struct CategoryCellViewModel {
        let name: String
        let options: [String]
    }
}
