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
}

class CardsListPresenter: CardsListPresenterProtocol {
    weak var controller: CardsListViewControllerProtocol?
    
    init(with controller: CardsListViewControllerProtocol) {
        self.controller = controller
    }
    
    func presentCategoryName(_ name: String) {
        controller?.displayCategoryName(name)
    }

}
