//
//  CategoryCollectionViewCell.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont(name: "AvenirNext-Bold", size: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        
        addSubview(categoryLabel)
        categoryLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
