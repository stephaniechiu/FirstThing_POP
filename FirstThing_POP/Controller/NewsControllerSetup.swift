//
//  NewsControllerSetup.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/18/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension NewsController: ControllerDelegate {
    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupLayout() {
        view.addSubview(newsTableView)
        newsTableView.anchor(top: newsView.titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20)
    }
    
    func setupTableView() {
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: Cell.titleCellID)
        newsTableView.estimatedRowHeight = 50
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.separatorStyle = .none
    }
}
