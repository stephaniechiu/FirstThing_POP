//
//  NewsDetailsTableViewCell.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/20/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class NewsDetailsTableViewCell: UITableViewCell {

// MARK: - Properties
//
//    //Description of the article
//    var descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        label.textColor = .label
//        label.font = UIFont(name: "AvenirNext", size: 14)
//        return label
//    }()
//
//    //Users can click "Read More" to read the article within the app
//    var readMoreButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Read More", for: .normal)
//        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 12)
//        button.setTitleColor(.label, for: .normal)
//        button.addTarget(self, action: #selector(openURL(sender:)), for: .touchUpInside)
//        return button
//    }()
//
//    //How long ago since the article was published
//    var lastUpdatedLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .systemGray
//        label.font = UIFont(name: "AvenirNext", size: 12)
//        return label
//    }()
//
//
//    //Closure created for Read More action to assign the parsed JSON url to it in NewsController cellForRowAtIndexPath
//    var readMoreAction: ((UIButton) -> Void)?
    
// MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Helper Functions
    func setupCellLayout() {
//        addSubview(descriptionLabel)
//        descriptionLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 40, paddingRight: 20)
//        
//        addSubview(lastUpdatedLabel)
//        lastUpdatedLabel.anchor(top: descriptionLabel.bottomAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingBottom: 10, paddingRight: 40)
//
//        addSubview(readMoreButton)
//        readMoreButton.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 40, paddingBottom: 10)
    }
    
//    @objc func openURL(sender: UIButton) {
//        self.readMoreAction?(sender)
//    }
    
}
