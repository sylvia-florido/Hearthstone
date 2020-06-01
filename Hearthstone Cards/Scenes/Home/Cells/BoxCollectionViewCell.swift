//
//  BoxCollectionViewCell.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 31/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

class BoxCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 16
        self.cardView.layer.shadowColor = UIColor.black.cgColor
        self.cardView.layer.shadowOpacity = 0.12
        self.cardView.layer.shadowRadius = 6
        self.cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.backgroundColor = UIColor(red: .random(in: 0...0.58), green: .random(in: 0...0.58), blue: .random(in: 0...0.58), alpha: 1)
    }
    
    

}
