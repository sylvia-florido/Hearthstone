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
    func displayImagesCache(_ cacheCount: Int)
    func displayActivityIndicator(_ open: Bool)
    func displayError(_ message: String)
}

class CardsListViewController: UIViewController, CardsListViewControllerProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var router: HearthstoneRouterProtocol?
    var interactor: CardsListInteractorProtocol?
    
    @IBOutlet weak var filterNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingViewHeight: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var imagesUrlStr: [String]?
    var imagesCacheCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupViews()
        interactor?.getCategoryName()
        interactor?.fetchCards()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        interactor?.stopFetching()
    }
    
    
    private func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        emptyStateView.isHidden = true
    }
    
    func displayCategoryName(_ viewModel: CardsListViewModel.CategoryName) {
        self.filterNameLabel.text = viewModel.filterName
    }
    
    func displayImages(_ viewModel: CardsListViewModel.CardsUrls) {
        self.imagesUrlStr = viewModel.cardsUrlList
        emptyStateView.isHidden = true
        collectionView.reloadData()
        fetching = false
    }
    
    func displayImagesCache(_ cacheCount: Int) {
        self.imagesCacheCount = cacheCount
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
                HearthstoneRepository().getImage(withURL: url ) { image in
                    cell.imageView.image = image
                }
            }
        }
        return cell
    }
    

    
    var fetching: Bool = false
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > (contentHeight - scrollView.frame.height - 200) {
            if !fetching {
                beginFetch()
            }
        }
    }
    
    func beginFetch() {
        fetching = true
        interactor?.fetchMoreImages()
    }
    
    func displayActivityIndicator(_ open: Bool) {
        open ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        
        UIView.animate(withDuration: 0.5) {
            self.loadingViewHeight.constant = open ? 200 : 0
        }
    }
    
    func displayError(_ message: String) {
        emptyStateView.isHidden = false
        errorMessageLabel.text = message
    }
}


