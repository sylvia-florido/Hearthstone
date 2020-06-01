//
//  CardsListViewController.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

protocol CardsListViewControllerProtocol: class {
    func displayCategoryName(_ name: String)
}

class CardsListViewController: UIViewController, CardsListViewControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource {

    var router: HearthstoneRouterProtocol?
    var interactor: CardsListInteractorProtocol?
    
    @IBOutlet weak var filterNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        interactor?.getCategoryName()
        interactor?.fetchCards()
    }


   private func setupViews() {
       collectionView.dataSource = self
       collectionView.delegate = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func displayCategoryName(_ name: String) {
        self.filterNameLabel.text = name
    }
    
    
    // MARK: - Navigation
    @IBAction func backButton(_ sender: UIButton) {
        router?.backFromCardsListScene()
    }
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
}
