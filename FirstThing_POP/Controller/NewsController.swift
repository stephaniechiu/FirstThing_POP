//
//  NewsController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
//import UserNotifications

class NewsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
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
        
//        let networkService = NetworkService()
//        networkService.getNewsArticlesByURL(url: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e2f0b28b0f0146dcb2b9c2ce5c3142a7")
        
        if let url = URL(string: topHeadlinesURL) {
            if let data = try? Data(contentsOf: url) {
                getLatestNewsArticles(json: data)
            }
        }
    }
        
    // MARK: - API Call
        //Create view model > api call. Create delegate (ex apidelegate), update with data
    func getLatestNewsArticles(json: Data) {
        let decoder = JSONDecoder()

        if let JSONArticles = try? decoder.decode(Articles.self, from: json) {
            articles = JSONArticles.articles
            print(articles)
            newsTableView.reloadData()
        }
    }
    
    // MARK: - Helper Functions

    func setupNavigationController() {
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupLayout() {
        view.addSubview(newsTableView)
        newsTableView.anchor(top: newsView.titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20)
    }
    
    func setupTableView() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: Cell.titleCellID)
//        newsTableView.register(NewsDetailsTableViewCell.self, forCellReuseIdentifier: Cell.detailsCellID)
        newsTableView.estimatedRowHeight = 50
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.separatorStyle = .none
    }
    
// MARK: - Selectors
    
// MARK: - TableView Data Source
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.titleCellID, for: indexPath)
        let articleTitle = articles[indexPath.row]
        cell.textLabel?.text = articleTitle.title
        return cell
    }
}

