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
    var repository: HearthstoneRepository
    var categories: [CardCategory]?
    
    init(with presenter: HomePresenterProtocol, repository: HearthstoneRepository) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func fetchCategories() {
        repository.getCategories { (gameInfo, error) in
            if let gameInfo = gameInfo {
                self.categories = gameInfo.cardCategories
                self.presenter.presentCategories(gameInfo.cardCategories)
            } else {
                // display error
            }
        }
    }
    
    func didSelect(categoryIndex: Int, optionIndex: Int) {
        guard let categories = categories, categories.count > categoryIndex else { return }
        let selectedCategory = categories[categoryIndex]
        
        guard selectedCategory.options.count > optionIndex else { return }
        let option = selectedCategory.options[optionIndex]
        
        presenter.presentCardsList(categoryType: selectedCategory.filterType, option: option)
    }
}
