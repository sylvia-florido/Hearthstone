//
//  HomePresenter.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    func presentCategories(_ categories: [CardCategory])
    func presentCardsList(categoryName: String, option: String)
}

class HomePresenter: HomePresenterProtocol {
    weak var controller: HomeViewControllerProtocol?
    
    init(with controller: HomeViewControllerProtocol) {
        self.controller = controller
    }
    
    func presentCategories(_ categories: [CardCategory]) {
        let categoryCellViewModel = categories.map { (cat) -> HomeViewModel.CategoryCellViewModel in
            HomeViewModel.CategoryCellViewModel(name: cat.name, options: cat.options)
        }
        let viewModel = HomeViewModel(categories: categoryCellViewModel)
        controller?.displayCategories(viewModel)
    }
    
    func presentCardsList(categoryName: String, option: String) {
        controller?.displayCardsListScene(categoryName: categoryName, option: option)
    }

}
