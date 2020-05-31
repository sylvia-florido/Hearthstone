//
//  CardsListInteractor.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation

protocol CardsListInteractorProtocol {
    
}

class CardsListInteractor: CardsListInteractorProtocol {
    
    var presenter: CardsListPresenterProtocol
    
    init(with presenter: CardsListPresenterProtocol) {
        self.presenter = presenter
    }
    
}
