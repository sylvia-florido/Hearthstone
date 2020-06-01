//
//  HomeInteractor.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol HomeInteractorProtocol {
    func fetchCategories()
}

class HomeInteractor: HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol
    
    var categories: [CardCategory]?
    
    init(with presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchCategories() {
        let gameInfo = GameInfo(with: [], classes: ["a", "b", "c"], types: ["a", "b", "c"], factions: ["a", "b", "c"], qualities: ["a", "b", "c"], races: [])
        self.categories = gameInfo.cardCategories
        
        if let categories = self.categories {
            presenter.presentCategories(categories)
        } else {
            // display error
        }
    }
}
