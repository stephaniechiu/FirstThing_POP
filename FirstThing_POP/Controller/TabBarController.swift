//
//  TabBarController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK: - Properties
    
    let newsController = NewsController()
    let categoryController = CategoryController()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        setupTabBarItems()
    }
    
    //MARK: - Helper Functions
    
    func setupTabBarItems() {
        newsController.tabBarItem.image = UIImage(systemName: "square.and.pencil")
        newsController.title = "Top Headlines"
        
        categoryController.tabBarItem.image = UIImage(systemName: "square.and.pencil")
        categoryController.title = "Categories"
        
        let tabBarController = [newsController, categoryController]
        UITabBar.appearance().barTintColor = .white
        viewControllers = tabBarController
    }
}
