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
    func showCardsList()
}


class HearthstoneRouter: HearthstoneRouterProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeScene()
    }
    
    func showHomeScene() {
        let controller = HomeViewController()
        let presenter = HomePresenter(with: controller)
        let interactor = HomeInteractor(with: presenter)
        controller.interactor = interactor
        controller.router = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showCardsList() {
        let controller = CardsListViewController()
        let presenter = CardsListPresenter(with: controller)
        let interactor = CardsListInteractor(with: presenter)
        controller.interactor = interactor
        controller.router = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    
}
