//
//  CategoryControllerDelegate.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/22/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension CategoryController: UICollectionViewDelegate {
    
    func parseFromJSON(categoryURL: String) {
        let networkService = NetworkService()
        articles = networkService.getNewsArticlesByURL(url: categoryURL)
        
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        articles.removeAll()
        if let cell = collectionView.cellForItem(at: indexPath) {
            print(category[indexPath.row].categoryURL)
            
            parseFromJSON(categoryURL: category[indexPath.row].categoryURL)
            
            cell.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            
            
            newsTableView.reloadData()
            cell.backgroundColor = .white
        }
    }
}
