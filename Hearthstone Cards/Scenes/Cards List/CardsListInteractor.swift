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
    func fetchMoreImages()
    func stopFetching()
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
        presenter.presentError("Loading cards ...")
        repository.getCardsByFilter(filter: categoryFilter, option: option) {  (cards, error) in
            if let cards = cards {
                let cardsWithUrls = cards.filter { !$0.imgUrl.isEmpty }
                self.cards = cardsWithUrls
                print("Got \(cardsWithUrls.count) cards with urls.")
                self.fetchMoreImages()
            } else {
                self.presenter.presentError("Desculpe, não foi possível carregar cards nesse momento.")
            }
        }
    }
    
    func stopFetching() {
        shouldContinueDataRefresh = false
    }
    
    var page: Int = 0
    var batch: Int = 8
    var shouldContinueDataRefresh = true
    
    var startIndex: Int {
        return page * batch
    }
    
    var endIndex: Int {
        let cardsCount = self.cards?.count ?? 0
        let end = startIndex + batch
        return min(end, cardsCount)
    }
    
    var cachedUrlStrings: [String] = [String]()

    func fetchMoreImages() {
        guard shouldContinueDataRefresh else { return }  // case viewWillDisappear
        guard let cards = cards else { return }
        guard endIndex >= startIndex else { return }  // case no more images to show
        
        presenter.presentActivityIndicator(true)
        
        let downloadGroup = DispatchGroup()
        print("Initial urls for page \(page): ------------------- ")
        let _ = cards[startIndex..<endIndex].map { print($0.imgUrl)}
        
        let _ = cards[startIndex..<endIndex].map { (card) in
            
            downloadGroup.enter()
            if let url = URL(string: card.imgUrl) {
                repository.cacheImage(withURL: url) { (success) in
                    if success {
                        self.cachedUrlStrings.append(card.imgUrl)
                    }
                    downloadGroup.leave()
                }
            }
        }
        
        
        downloadGroup.notify(queue: DispatchQueue.main) {
            self.page += 1
            if self.cachedUrlStrings.count < self.batch {
                self.fetchMoreImages()
            } else {
                self.presenter.presentActivityIndicator(false)
                self.presenter.presentImages(self.cachedUrlStrings)
            }
        }
    }
    
    
}
