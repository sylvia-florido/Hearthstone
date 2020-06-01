//
//  CardsListViewController.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

protocol CardsListViewControllerProtocol: class {
    func displayCategoryName(_ viewModel: CardsListViewModel.CategoryName)
    func displayImages(_ viewModel: CardsListViewModel.CardsUrls)
}

class CardsListViewController: UIViewController, CardsListViewControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource {

    var router: HearthstoneRouterProtocol?
    var interactor: CardsListInteractorProtocol?
    
    @IBOutlet weak var filterNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imagesUrlStr: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupViews()
        interactor?.getCategoryName()
        interactor?.fetchCards()
    }
    


   private func setupViews() {
       collectionView.dataSource = self
       collectionView.delegate = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    func displayCategoryName(_ viewModel: CardsListViewModel.CategoryName) {
        self.filterNameLabel.text = viewModel.filterName
    }
    
    func displayImages(_ viewModel: CardsListViewModel.CardsUrls) {
        self.imagesUrlStr = viewModel.cardsUrlList
        collectionView.reloadData()
    }

    // MARK: - Navigation
    @IBAction func backButton(_ sender: UIButton) {
        router?.backFromCardsListScene()
    }
    
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesUrlStr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        
        if let urlStr = imagesUrlStr, urlStr.count > indexPath.row {
            if let url = URL(string: urlStr[indexPath.row]) {
                print("URL : \(url.absoluteString)")
                HearthstoneRepository().getImage(withURL: url ) { image in
                    cell.imageView.image = image
                }
            }
        }
        return cell
    }
}


