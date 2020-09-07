//
//  NewsTableViewCell.swift
//  FirstThingPOP
//
//  Created by Stephanie on 8/20/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import SafariServices

class NewsTableViewCell: UITableViewCell {
    
// MARK: - Properties
    
    weak var delegate: ReadActionDelegate?
    var url: String = ""
    
    let container: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .label
        label.font = UIFont(name: "AvenirNext-Bold", size: 14)
        return label
    }()
    
    var newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 3
        image.clipsToBounds = true
        return image
    }()
    
    //Description of the article
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .label
        label.font = UIFont(name: "AvenirNext-Regular", size: 12)
        return label
    }()
    
    //Users can click "Read More" to read the article within the app
    var readMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Read More", for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 12)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    //How long ago since the article was published
    var lastUpdatedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont(name: "AvenirNext-Regular", size: 10)
        return label
    }()
    
    //Closure created for Read More action to assign the parsed JSON url to it in NewsController cellForRowAtIndexPath
    var readMoreAction: ((UIButton) -> Void)?

// MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(container)
        container.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4)
        
        addSubview(newsTitleLabel)
        newsTitleLabel.anchor(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: newsTitleLabel.bottomAnchor, left: container.leftAnchor, right: container.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
        
        addSubview(lastUpdatedLabel)
        lastUpdatedLabel.anchor(top: descriptionLabel.bottomAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingBottom: 10, paddingRight: 40)

        readMoreButton.addTarget(self, action: #selector(openURL(sender:)), for: .touchUpInside)
        addSubview(readMoreButton)
        readMoreButton.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeft: 40, paddingBottom: 10)
        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func openURL(sender: UIButton) {
        let articleViewController = URL(string: url)!
        delegate?.present(from: articleViewController)
        print(articleViewController)
//        self.readMoreAction?(sender)
    }
    
    // MARK: - Helper Functions
    
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.contentView.layoutIfNeeded()
        })
    }
    
    func setupCellFromJSONData(section: Article) {
        let currentTime = Date()
        let formatter = ISO8601DateFormatter()
        let publishedTimeFormat = formatter.date(from: section.publishedAt) ?? currentTime
        lastUpdatedLabel.text = publishedTimeFormat.timeAgoDisplay()
        
        selectionStyle = .none
        
        //Title of article
        newsTitleLabel.text = section.title
        
        //Article description
        descriptionLabel.text = section.description
        
        //Article URL
        url = section.url
    }
    
}

