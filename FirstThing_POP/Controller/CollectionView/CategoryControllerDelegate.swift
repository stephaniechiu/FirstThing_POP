//
//  CategoryControllerDelegate.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/22/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension CategoryController: UICollectionViewDelegate {
    
    // MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            print(category[indexPath.row].categoryURL)
            cell.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = .white
        }
    }
}
