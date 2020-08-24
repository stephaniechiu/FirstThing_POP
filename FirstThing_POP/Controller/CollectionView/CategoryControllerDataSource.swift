//
//  CategoryControllerDataSource.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension CategoryController: UICollectionViewDataSource {
    
    // MARK: - CollectionView Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = category[indexPath.row].category
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 300)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        enum LayoutConstant {
//            static let spacing: CGFloat = 16.0
//            static let itemHeight: CGFloat = 30.0
//        }
//
//        let width = itemWidth(for: view.frame.width, spacing: 0)
//
//        return CGSize(width: width, height: LayoutConstant.itemHeight)
//    }
//
//    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
//        let itemsInRow: CGFloat = 3
//
//        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
//        let finalWidth = (width - totalSpacing) / itemsInRow
//
//        return finalWidth - 5.0
//    }
    

}
