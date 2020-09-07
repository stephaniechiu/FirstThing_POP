//
//  NewsControllerSetup.swift
//  FirstThingPOP
//
//  Created by Stephanie on 8/18/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

/*
 Sets up the navigation controller, layout, and tableView for the News Controller
 */

import UIKit

extension NewsController: ControllerDelegate {
    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupLayout() {
        view.addSubview(newsTableView)
        newsTableView.anchor(top: newsView.titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 20)
    }
    
    func setupTableView() {
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Cell.titleCellID)
        newsTableView.estimatedRowHeight = 70
        newsTableView.rowHeight = UITableView.automaticDimension
//        newsTableView.separatorStyle = .none
    }
}
