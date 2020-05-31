//
//  CardsListPresenter.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol CardsListPresenterProtocol {
    
}

class CardsListPresenter: CardsListPresenterProtocol {
    weak var controller: CardsListViewControllerProtocol?
    
    init(with controller: CardsListViewControllerProtocol) {
        self.controller = controller
    }
}
