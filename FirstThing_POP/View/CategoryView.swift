//
//  CategoryView.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class CategoryView: UIView, ViewLayoutDelegate {
    
    // MARK: - Properties
    weak var delegate: ViewLayoutDelegate?
    var viewBackgroundColor: UIColor = .systemBackground
    
    var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.text = "Choose a category to read"
        title.font = UIFont(name: "AvenirNext-Bold", size: 24)
        return title
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewLayout()
    }
        
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewLayout() {
        backgroundColor = viewBackgroundColor
        
        addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15)
    }
    
    
}
