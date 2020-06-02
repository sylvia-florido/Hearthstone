//
//  CardsListPresenter.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol CardsListPresenterProtocol {
    func presentCategoryName(_ name: String)
    func presentImages(_ imagesUrlStr: [String])
    func presentImages(_ cacheCount: Int)
}

class CardsListPresenter: CardsListPresenterProtocol {
    weak var controller: CardsListViewControllerProtocol?
    
    init(with controller: CardsListViewControllerProtocol) {
        self.controller = controller
    }
    
    func presentCategoryName(_ name: String) {
        let viewModel = CardsListViewModel.CategoryName(filterName: name)
        controller?.displayCategoryName(viewModel)
    }
    
    func presentImages(_ imagesUrlStr: [String]) {
        let viewModel = CardsListViewModel.CardsUrls(cardsUrlList: imagesUrlStr)
        controller?.displayImages(viewModel)
    }
    
    func presentImages(_ cacheCount: Int) {
//        let viewModel = CardsListViewModel.CardsUrls(cacheCount: cacheCount, cardsUrlList: [String]())
        controller?.displayImagesCache(cacheCount)
    }

}
