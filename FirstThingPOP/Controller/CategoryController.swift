//
//  CategoryController.swift
//  FirstThingPOP
//
//  Created by Stephanie on 8/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import SafariServices

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
        
        newsTableView.dataSource = self
    }

}

    // MARK: - CollectionView Data Source

extension CategoryController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = category[indexPath.row].category
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: 200)
    }

}

    // MARK: - CollectionView Delegate

extension CategoryController: UICollectionViewDelegate {
    
    func parseFromJSON(categoryURL: String) {
        let networkService = NetworkService()
        articles = networkService.getNewsArticlesByURL(url: categoryURL)
        
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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

    //MARK: - TableView Data Source

extension CategoryController: UITableViewDataSource {
    
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
        
        let section = articles[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.titleCellID, for: indexPath) as! NewsTableViewCell
        
        let currentTime = Date()
        let formatter = ISO8601DateFormatter()
        let publishedTime = formatter.date(from: section.publishedAt) ?? currentTime
        let timeSincePublished = Calendar.current.dateComponents([.minute, .hour], from: publishedTime, to: currentTime)
        let minutes = timeSincePublished.minute
        let hours = timeSincePublished.hour
        
        cell.selectionStyle = .none
        
        //Title of article
        cell.newsTitleLabel.text = section.title
        
        //Article description
        cell.descriptionLabel.text = section.description
        
        //Read more button to
        cell.readMoreAction = { sender in
            let articleURL = URL(string: section.url)
            let articleViewController = SFSafariViewController(url: articleURL!)
            self.present(articleViewController, animated: true, completion: nil)
        }
        
        //Time since article was published
        if minutes == 1  && hours ?? 0 < 1 {
            cell.lastUpdatedLabel.text = "\(minutes ?? 0) minute ago"
        } else if minutes! < 60 && hours! < 1 {
            cell.lastUpdatedLabel.text = "\(minutes ?? 0) minutes ago"
        } else if minutes ?? 1 == 60 || hours ?? 1 == 1 {
            cell.lastUpdatedLabel.text = "\(hours ?? 0) hour ago"
        } else if minutes! < 60 && hours ?? 1 > 1 {
            cell.lastUpdatedLabel.text = "\(hours ?? 0) hours ago"
        }
    
        return cell
    }
}
