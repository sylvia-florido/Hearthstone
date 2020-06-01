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
    
    let presenter: CardsListPresenterProtocol
    let repository: HearthstoneRepository
    let categoryName: String
    let categoryFilter: CardsFilter
    let option: String
    var cards: [Card]?
    
    init(with presenter: CardsListPresenterProtocol, repository: HearthstoneRepository, categoryType: CardsFilter, option: String) {
        self.presenter = presenter
        self.repository = repository
        self.categoryName = categoryType.rawValue
        self.categoryFilter = categoryType
        self.option = option
    }
    
    func getCategoryName() {
        presenter.presentCategoryName(categoryName)
    }
    
    func fetchCards() {
        repository.getCardsByFilter(filter: categoryFilter, option: option) {  (cards, error) in
            if let cards = cards {
                self.cards = cards
                let cardsWithImages = cards.filter { !$0.imgUrl.isEmpty }
                let urlStrs = cardsWithImages.map{ $0.imgUrl }
                self.presenter.presentImages(urlStrs)
            } else {
                // display error
            }
        }
    }

    
}
