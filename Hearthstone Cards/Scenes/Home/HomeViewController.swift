//
//  HomeViewController.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: class {
    
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    var router: HearthstoneRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


   
    // MARK: - Navigation
    @IBAction func showCardsButton(_ sender: UIButton) {
        router?.showCardsList()
    }
    
}
