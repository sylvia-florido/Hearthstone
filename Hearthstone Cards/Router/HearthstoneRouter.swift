//
//  HearthstoneRouter.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import Foundation
import UIKit

protocol HearthstoneRouterProtocol: class {
    var navigationController: UINavigationController { get set }
    func start()
    func showHomeScene()
    func showCardsList(categoryType: CardsFilter, option: String)
    func backFromCardsListScene()
}


class HearthstoneRouter: HearthstoneRouterProtocol {
    
    var navigationController: UINavigationController
    var repository: HearthstoneRepository = HearthstoneRepository()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeScene()
    }
    
    func showHomeScene() {
        let controller = HomeViewController()
        let presenter = HomePresenter(with: controller)
        let interactor = HomeInteractor(with: presenter, repository: repository)
        controller.interactor = interactor
        controller.router = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showCardsList(categoryType: CardsFilter, option: String) {
        let controller = CardsListViewController()
        let presenter = CardsListPresenter(with: controller)
        let interactor = CardsListInteractor(with: presenter, repository: repository, categoryType: categoryType, option: option)
        controller.interactor = interactor
        controller.router = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func backFromCardsListScene() {
        navigationController.popViewController(animated: true)
    }
}
