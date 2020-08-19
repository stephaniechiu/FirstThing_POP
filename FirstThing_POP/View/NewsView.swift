//
//  NewsView.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class NewsView: UIView, ViewLayoutDelegate {

    
// MARK: - Properties
    weak var delegate: ViewLayoutDelegate?
    var viewBackgroundColor: UIColor = .systemBackground
    var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.font = UIFont(name: "AvenirNext-Bold", size: 24)
        
        let currentTime = Date()
        let hour = Calendar.current.component(.hour, from: currentTime)
        if hour < 12 {
            title.text = "First thing this morning"
        } else if hour >= 12 && hour < 18 {
            title.text = "First thing this afternoon"
        } else if hour >= 18 && hour <= 24 {
            title.text = "First thing this evening"
        }
        
        return title
    }()
    
// MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Helper Functions
    
    func setupViewLayout() {
        backgroundColor = viewBackgroundColor
        addSubview(titleLabel)
        titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 15)
    }
}
