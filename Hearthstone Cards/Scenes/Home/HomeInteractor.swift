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
    func didSelect(categoryIndex: Int, optionIndex: Int)
}

class HomeInteractor: HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol
    
    var categories: [CardCategory]?
    
    init(with presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchCategories() {
        let gameInfo = GameInfo(with: ["a"], classes: ["a", "b", "c"], types: ["a", "b", "c"], factions: ["a", "b", "c"], qualities: ["a", "b", "c"], races: ["a", "b"])
        self.categories = gameInfo.cardCategories
        
        if let categories = self.categories {
            presenter.presentCategories(categories)
        } else {
            // display error
        }
    }
    
    func didSelect(categoryIndex: Int, optionIndex: Int) {
        guard let categories = categories, categories.count > categoryIndex else { return }
        let selectedCategory = categories[categoryIndex]
        
        guard selectedCategory.options.count > optionIndex else { return }
        let option = selectedCategory.options[optionIndex]
        
        presenter.presentCardsList(categoryName: selectedCategory.name, option: option)
    }
}
