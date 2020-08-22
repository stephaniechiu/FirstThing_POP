//
//  NewsController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class NewsController: UIViewController {
        
    // MARK: - Properties
    
    let newsView = NewsView()
    let newsTableView = UITableView()
    var articles = [Article]()
    let topHeadlinesURL = NewsURL.topHeadlines
        
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = newsView
        
        setupNavigationController()
        setupLayout()
        setupTableView()
        sendNotification()
        parseFromJSON()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
    func parseFromJSON() {
        let networkService = NetworkService()
        articles = networkService.getNewsArticlesByURL(url: topHeadlinesURL)
        
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
}

