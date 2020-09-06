//
//  NewsController.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/14/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import SafariServices

protocol ReadActionDelegate: class {
    func present(from url: URL)
}

class NewsController: UIViewController, ReadActionDelegate {
    func present(from url: URL) {
        self.present(SFSafariViewController(url: url), animated: true, completion: nil)
        print("click")
    }
        
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
    }
    
    func parseFromJSON() {
        let networkService = NetworkService()
        articles = networkService.getNewsArticlesByURL(url: topHeadlinesURL)
        
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}

    //MARK: - TableView Data Source

extension NewsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.titleCellID, for: indexPath) as! NewsTableViewCell
        
        cell.setupCellFromJSONData(section: articles[indexPath.section])
    
        return cell
    }
}

