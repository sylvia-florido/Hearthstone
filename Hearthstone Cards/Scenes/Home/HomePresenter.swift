//
//  HomePresenter.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    
}

class HomePresenter: HomePresenterProtocol {
    weak var controller: HomeViewControllerProtocol?
    
    init(with controller: HomeViewControllerProtocol) {
        self.controller = controller
    }
}
