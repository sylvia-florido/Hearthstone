//
//  CardsListInteractor.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol CardsListInteractorProtocol {
    func getCategoryName()
    func fetchCards()
}

class CardsListInteractor: CardsListInteractorProtocol {
    
    var presenter: CardsListPresenterProtocol
    var categoryName: String
    var option: String
    
    init(with presenter: CardsListPresenterProtocol, categoryName: String, option: String) {
        self.presenter = presenter
        self.categoryName = categoryName
        self.option = option
    }
    
    func getCategoryName() {
        presenter.presentCategoryName(categoryName)
    }
    
    func fetchCards() {
        
    }

    
}
