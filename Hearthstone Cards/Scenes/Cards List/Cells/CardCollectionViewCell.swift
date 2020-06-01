//
//  CardCollectionViewCell.swift
//  Hearthstone Cards
//
//  Created by Silvia Florido on 31/05/20.
//  Copyright © 2020 Silvia Florido. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func prepareForReuse() {
           super.prepareForReuse()
           imageView?.image = nil
       }
}
