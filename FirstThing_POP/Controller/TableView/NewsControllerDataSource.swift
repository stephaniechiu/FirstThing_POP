//
//  NewsControllerDataSource.swift
//  FirstThing_POP
//
//  Created by Stephanie on 8/18/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import SafariServices

extension NewsController: UITableViewDataSource {
    
    //MARK: - TableView Data Source
    
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
        } else if minutes ?? 0 < 60 && hours ?? 0 < 1 {
            cell.lastUpdatedLabel.text = "\(minutes ?? 0) minutes ago"
        } else if minutes ?? 1 == 60 || hours ?? 1 == 1 {
            cell.lastUpdatedLabel.text = "\(hours ?? 0) hour ago"
        } else if minutes! < 60 && hours ?? 1 > 1 {
            cell.lastUpdatedLabel.text = "\(hours ?? 0) hours ago"
        }
    
        return cell
    }
}
