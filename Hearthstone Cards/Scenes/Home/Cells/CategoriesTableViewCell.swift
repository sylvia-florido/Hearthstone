//
//  CategoriesTableViewCell.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 31/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var category: HomeViewModel.CategoryCellViewModel? {
        didSet {
            update()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "BoxCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    private func update() {
        nameLabel.text = category?.name
        collectionView.reloadData()
    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    

}

