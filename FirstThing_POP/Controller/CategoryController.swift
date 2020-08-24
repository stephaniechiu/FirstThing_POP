//
//  CategoryController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    
    // MARK: - Properties
    
    let categoryView = CategoryView()
    
    //CollectionView
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let viewLayout = UICollectionViewFlowLayout()
    var cellReuseIdentifier = Cell.categoryID
    var category: [Category] = []
    
    //TableView
    let newsTableView = UITableView()
    var articles = [Article]()

    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = categoryView
        
        category = fetchCategoryURL()
        
        setupNavigationController()
        setupLayout()
        setupCollectionView()
        setupTableView()
    }

}
