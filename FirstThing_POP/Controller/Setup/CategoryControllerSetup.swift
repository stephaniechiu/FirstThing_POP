//
//  CategoryControllerSetup.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension CategoryController: ControllerDelegate {

    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isHidden = false
    }
    
    func setupLayout() {
        view.addSubview(collectionView)
        collectionView.anchor(top: categoryView.titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, height: 50)
        
        view.addSubview(newsTableView)
        newsTableView.anchor(top: collectionView.bottomAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.setCollectionViewLayout(viewLayout, animated: true)
        
        //Set collectionView cell sizes and spacing from other cells
        viewLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        viewLayout.itemSize = CGSize(width: 40, height: 20)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.allowsMultipleSelection = true
    }
    
    func setupTableView() {
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Cell.titleCellID)
        newsTableView.estimatedRowHeight = 70
        newsTableView.rowHeight = UITableView.automaticDimension
    }
    
}
