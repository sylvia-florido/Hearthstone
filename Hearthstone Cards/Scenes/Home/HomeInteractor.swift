//
//  HomeInteractor.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol HomeInteractorProtocol {
    
}

class HomeInteractor: HomeInteractorProtocol {
    
    var presenter: HomePresenterProtocol
    
    init(with presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}
