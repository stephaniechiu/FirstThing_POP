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
        print("hello")
    }
    
    func setupCollectionViewLayout() {
        let collectionView: UICollectionView = {
            let viewLayout = UICollectionViewFlowLayout()
                
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
            collectionView.backgroundColor = .systemBackground
                
            collectionView.setCollectionViewLayout(viewLayout, animated: true)
            return collectionView
        }()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.allowsMultipleSelection = true
        
        view.addSubview(collectionView)
        collectionView.anchor(top: categoryView.titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 20, paddingRight: 10)
    }
    
}
