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
}

class HomeViewController: UIViewController, HomeViewControllerProtocol, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var router: HearthstoneRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoriesViewModel: [HomeViewModel.CategoryCellViewModel]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor?.fetchCategories()
    }

    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

    func displayCategories(_ categories: HomeViewModel) {
        categoriesViewModel = categories.categories
    }

    // MARK: - Navigation
    @IBAction func showCardsButton(_ sender: UIButton) {
        router?.showCardsList()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        let category = categoriesViewModel?[collectionView.tag]
        cell.nameLabel.text = category?.options[indexPath.row]
        return cell
    }
    
    
    
    
}


struct HomeViewModel {
    let categories: [CategoryCellViewModel]
    
    struct CategoryCellViewModel {
        let name: String
        let options: [String]
    }
}
