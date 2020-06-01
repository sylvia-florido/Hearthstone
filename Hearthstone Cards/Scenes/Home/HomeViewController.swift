//
//  HomeViewController.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 30/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

protocol HomeViewControllerProtocol: class {
    func displayCategories(_ categories: HomeViewModel)
    func displayCardsListScene(categoryType: CardsFilter, option: String)
}

class HomeViewController: UIViewController, HomeViewControllerProtocol, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var router: HearthstoneRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var categoriesViewModel: [HomeViewModel.CategoryCellViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupViews()
        interactor?.fetchCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tableView.removeObserver(self, forKeyPath: "contentSize")
        super.viewWillDisappear(animated)
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize") {
            if let newvalue = change?[.newKey] {
                let newsize  = newvalue as! CGSize
                tableViewHeight.constant =  newsize.height
            }
        }
    }
    
    private func setupViews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func displayCategories(_ categories: HomeViewModel) {
        categoriesViewModel = categories.categories
    }
    
    // MARK: - Navigation
    func displayCardsListScene(categoryType: CardsFilter, option: String) {
        router?.showCardsList(categoryType: categoryType, option: option)
    }

    
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoriesTableViewCell
        
        if let categories = categoriesViewModel, categories.count > indexPath.row {
            cell.category = categories[indexPath.row]
            cell.collectionView.tag = indexPath.row
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CategoriesTableViewCell else { return }
        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }

    
    
    // MARK: - CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesViewModel?[collectionView.tag].options.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BoxCollectionViewCell
        let category = categoriesViewModel?[collectionView.tag]
        cell.nameLabel.text = category?.options[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = collectionView.tag
        let option = indexPath.row
        interactor?.didSelect(categoryIndex: category, optionIndex: option)
    }
    
    
    
}


