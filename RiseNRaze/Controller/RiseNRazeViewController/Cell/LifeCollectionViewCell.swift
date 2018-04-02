//
//  LifeCollectionViewCell.swift
//  RiseNRaze
//
//  Created by Rahul Chona on 02/04/18.
//  Copyright © 2018 Rahul Chona. All rights reserved.
//

import UIKit

class LifeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lifeImageView: UIImageView!
    
    //MARK: - View life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.borderWidth = 0.5
    }
    
    func configureCell(life: RRConstants.LifeStatus) {
        if life == RRConstants.LifeStatus.Alive {
            self.contentView.backgroundColor = UIColor.green
        } else { // Dead
            self.contentView.backgroundColor = UIColor.black
        }
    }
}
