//
//  CategoryController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class CategoryController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Properties
    let categoryView = CategoryView()
    var cellReuseIdentifier = Cell.categoryID
    var category: [Category] = []

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = categoryView
        
        category = fetchCategoryURL()
        setupCollectionViewLayout()
    }

}
